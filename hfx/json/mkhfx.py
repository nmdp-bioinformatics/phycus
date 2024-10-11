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

# request header
requestHeader = {
  "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.75 Safari/537.36",
  "X-Requested-With": "XMLHttpRequest"
}

# File path defaults
hapfreq_file = '../data/US_CAU.freqs'
json_file = './hfx.json'
schema_file = './hfx.schema.json'
metadata_file = './hfx.metadata.json'

def load_hapfreq_dataframe(path, afnd_input=False):
    if afnd_input:
        return get_hapfreqs_from_AFND(path)
    else:
        return pd.read_csv(path, header=None, index_col=None)

# Function to get the haplotype frequencies from a pandas dataframe
def extract_hapfreqs(df, percentageToFloat=False):

    # Get the haplotype and frequency columns and return those rows as a list
    haploColumn = 0
    freqColumn = 1
    for colIndex in range(0, len(df.columns)):
        col = df.columns[colIndex]
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

def get_metadata(df_or_metadata_path):
    
    # Load the metadata JSON to understand the structure of metaData
    if isinstance(df_or_metadata_path, str):
        metadata_path = df_or_metadata_path
        with open(metadata_path, 'r', encoding='utf-8') as metadata_file:
            metadata_data = json.load(metadata_file)
        return metadata_data["metaData"]

    # if a dataframe is provided, the metadata is created with information from there before returning 
    elif isinstance(df_or_metadata_path, pd.DataFrame):    
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
                    metadata['outputResolution'].append({'locus': locus_allele.split('*')[0], 'resolution': get_resolution(locus_allele)})

            # TODO: Somehow get the geocode
            elif 'population' in col.lower():
                metadata['cohortDescription']['population'] = {'geoCode': None, 'ethnicity': df[col][0]}
            elif 'size' in col.lower():
                metadata['cohortDescription']['inputSize'] = int(df[col][0])

    return metadata

# TODO: Actually implement this
def get_resolution(allele):
    return None

def save_to_hfx(output_hfx_file, frequency_data, metadata):
    
    # Create final JSON structure
    final_data = {
        "metaData": metadata,
        "frequencyData": frequency_data
    }

    # Write to output JSON file
    with open(output_hfx_file, 'w', encoding='utf-8') as output_hfx:
        json.dump(final_data, output_hfx, indent=4)

def __main__():
    parser = argparse.ArgumentParser(description='configfile')
    parser.add_argument('--conf', required=True, default='config.json', help="Config file with locations of files")
    args = parser.parse_args()

    # Load config file
    if os.path.exists(args.conf):
        with open(args.conf, 'rt') as f:
            config = json.load(f)

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

    # Combine both and save to hfx
    save_to_hfx(output_hfx_file, hapfreqs, metadata)

__main__()

