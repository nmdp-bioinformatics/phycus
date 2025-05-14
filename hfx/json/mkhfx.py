#!/usr/bin/env python
##############################################################################
# SCRIPT NAME:	mkhfx.py
# DESCRIPTION:	read freqs file and create hfx.json
#
# DATE WRITTEN: 2024-10-10
# WRITTEN BY:   Martin Maiers
#
##############################################################################
import json
import argparse
import os
import requests
import pandas as pd
from jsonschema import validate
import pyard

# request header
requestHeader = {
  "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.75 Safari/537.36",
  "X-Requested-With": "XMLHttpRequest"
}

PYARD_RESOLUTION_EQUIVS = {
    'G': 'G',
    'P': 'P',
    'g': 'lg', 
    '4-Field': 'W',
    '3-Field': 'exon',
    '2-Field': 'U2',
    'Serology': 'S',
}

def load_hapfreq_dataframe(path, afnd_input=False):
    if afnd_input:
        return get_hapfreqs_from_AFND(path)
    return pd.read_csv(path, header=None, index_col=None)


# Function to get the haplotype frequencies from a pandas dataframe
def extract_hapfreqs(df, percentageToFloat=False):
    # Get the haplotype and frequency columns and return those rows as a list
    haploColumn = 0
    freqColumn = 1
    for colIndex, col in enumerate(df.columns):
        if isinstance(col, str):
            if 'freq' in col.lower():
                freqColumn = colIndex
            elif 'haplo' in col.lower():
                haploColumn = colIndex

    return [ {
        'haplotype': row[haploColumn+1].replace('-', '~'),
        'frequency': float(row[freqColumn+1] / (100 if percentageToFloat else 1))
    } for row in df.itertuples()]


def get_hapfreqs_from_AFND(url):
    result = requests.get(url, headers=requestHeader, timeout=None)
    hfs = pd.read_html(result.text, attrs={'class':'tblNormal'})[0]
    return hfs


def check_metadata_schema(metadata):
    "Check that the input metadata complies with schema."

    with open("./hfx.schema.json", 'r', encoding='utf-8') as metadata_schema_file:
        metadata_schema = json.load(metadata_schema_file)
    if 'metaData' not in metadata:
        raise ValueError("metaData not found in the metadata file")

    try:
        validate(instance=metadata['metaData'], schema=metadata_schema['properties']['metaData'])
    except Exception as e:
        raise ValueError(f"Metadata validation failed: {e}") from e


def get_metadata(df_or_metadata_path):
    # Load the metadata JSON to understand the structure of metaData
    if isinstance(df_or_metadata_path, str):
        metadata_path = df_or_metadata_path
        with open(metadata_path, 'r', encoding='utf-8') as metadata_file:
            metadata_data = json.load(metadata_file)
        check_metadata_schema(metadata_data)
        return metadata_data["metaData"]

    # if a dataframe is provided, the metadata is created with information from there before returning 
    if isinstance(df_or_metadata_path, pd.DataFrame):
        df = df_or_metadata_path
        metadata = {}
        metadata['outputResolution'] = []
        metadata['cohortDescription'] = {}
        metadata['cohortDescription']['population'] = {'geoCode': None, 'ethnicity': None}
        metadata['cohortDescription']['inputSize'] = None
        metadata['hfeMethod'] = {
            "method": None,
            "parameters": [
                {
                "parameter": None,
                "value": None
                }
            ]
        }
        metadata['nomenclatureUsed'] = {
            "kind": None,
            "version": None
        }

        # Add new info
        # TODO: Incomplete
        for col in df.columns:
            if 'haplo' in col.lower():
                longestSplitHaplo = None
                for haplo in df[col]:
                    splitHaplo = haplo.split('-')
                    if longestSplitHaplo is None or len(splitHaplo) > len(longestSplitHaplo):
                        longestSplitHaplo = splitHaplo

                # TODO: Determine resolution for each locus when provided a dataframe with HFs
                # or otherwise put it at 'variable'
                metadata['outputResolution'] = []
                for locus_allele in longestSplitHaplo:
                    metadata['outputResolution'].append(
                        {'locus': locus_allele.split('*')[0], 'resolution': get_resolution(locus_allele)})

            # TODO: Somehow get the geocode
            elif 'population' in col.lower():
                metadata['cohortDescription']['population'] = {'geoCode': None, 'ethnicity': df[col][0]}
            elif 'size' in col.lower():
                metadata['cohortDescription']['inputSize'] = int(df[col][0])

    return metadata


# TODO: Actually implement this
def get_resolution(allele):
    return None

def check_loci_order(hapfreqs, loci):
    required_loci = set(locus['locus'].split('HLA-')[-1] for locus in loci)
    input_loci = [
        [allele.split('*')[0] for allele in hapfreq['haplotype'].split('~')]
        for hapfreq in hapfreqs
    ]
    input_loci_order = set("~".join(locus) for locus in input_loci)

    if len(input_loci_order) > 1:
        raise ValueError("Order of loci in haplotypes inconsistent.")
    input_loci_split = list(input_loci_order)[0].split("~")
    if set(input_loci_split) != required_loci:
        raise ValueError(f"Input loci doesn't match the metadata loci. Input loci: {input_loci_split}, Metadata loci: {required_loci}")

    # Reorder loci to match input_loci_order
    loci_dict = {locus['locus']: locus for locus in loci}
    loci_metadata_ordered = [
        loci_dict[f"HLA-{locus}"]
        if "HLA" not in locus and f"HLA-{locus}" in loci_dict else loci_dict[locus]
        for locus in input_loci_split
    ]
    return loci_metadata_ordered


def check_resolution(hapfreqs, loci, nomenclature):
    if nomenclature['kind']=='imgt':
        ard = pyard.init(nomenclature['version'].replace('.',''))
    # TODO: Add support for other accepted nomenclatures (currently 'ipd')


    elif nomenclature['kind']=='ipd':
        raise ValueError("IPD nomenclature not yet supported")

    hapfreqs_split = [hapfreq['haplotype'].split('~') for hapfreq in hapfreqs]
    for i, locus in enumerate(loci):
        resolution = locus['resolution']
        if resolution=='g':
            # TODO
            print("g resolution validation not yet supported (issue reported in py-ard repo)")
            continue
        if resolution=='1-Field':
            # TODO
            print("1-field resolution validation not yet developed")
            continue

        locus_alleles = set(hapfreq[i] for hapfreq in hapfreqs_split)
        for locus_allele in locus_alleles:
            if resolution in PYARD_RESOLUTION_EQUIVS:
                try:
                    ard.redux(locus_allele, PYARD_RESOLUTION_EQUIVS[resolution])
                except Exception as e:
                    raise ValueError(f"Resolution check failed for {locus_allele} at {resolution} resolution: {e}") from e


def check_hapfreqs_metadata(hapfreqs, metadata):
    loci_metadata_ordered = check_loci_order(hapfreqs, metadata['outputResolution'])
    check_resolution(hapfreqs, loci_metadata_ordered, metadata['nomenclatureUsed'])


def save_to_hfx(output_hfx_file, frequency_data, metadata):
    # Create final JSON structure
    final_data = {
        "metaData": metadata,
        "frequencyData": frequency_data
    }

    # Write to output JSON file
    with open(output_hfx_file, 'w', encoding='utf-8') as output_hfx:
        json.dump(final_data, output_hfx, indent=4)


def get_parser():
    """Get arguments from argparser."""

    parser = argparse.ArgumentParser(description='configfile')
    parser.add_argument(
        '--conf',
        required=True,
        default='config.json',
        help="Config file with locations of files"
    )
    args = parser.parse_args()
    return args

def main():
    args = get_parser()

    # Load config file
    if os.path.exists(args.conf):
        with open(args.conf, 'rt', encoding='utf-8') as f:
            config = json.load(f)
    else:
        exit("Config file not found")

    # Get the output file name
    if config.get('output_hfx_file', False):
        output_hfx_file = config['output_hfx_file']
    else:
        exit("No output hfx file provided")

    # Get the input file(s)
    afnd_input = False
    if config.get('hapfreq_path', False):
        hapfreq_path = config['hapfreq_path']
        afnd_input = 'www.allelefrequencies.net' in hapfreq_path
    else:
        exit("No output hfx file provided")

    # Load the metadata file if the input file is not the afnd
    if not afnd_input:
        if config.get('metadata_file', False):
            metadata_file = config['metadata_file']
        else:
            exit("No metadata file provided")

    # Load the table with haplotype frequencies
    hapfreq_df = load_hapfreq_dataframe(hapfreq_path, afnd_input)

    # Extract only the haplotype frequencies as a list
    hapfreqs = extract_hapfreqs(hapfreq_df, afnd_input)

    # load the metadata
    metadata = get_metadata(hapfreq_df if afnd_input else metadata_file)

    # Sense check hapfreqs and metadata compatibility, 
    # not tested on AFND input, TODO
    check_hapfreqs_metadata(hapfreqs, metadata)

    # Combine both and save to hfx
    save_to_hfx(output_hfx_file, hapfreqs, metadata)


if __name__ == "__main__":
    main()
