#!/usr/bin/env python
##############################################################################
# SCRIPT NAME:	mkhfx.py
# DESCRIPTION:	read freqs file and create hfx.json
#
# DATE WRITTEN: 2024-10-10
# WRITTEN BY:   Martin Maiers
#
##############################################################################
import csv 
import json
import argparse
import sys
import os



def csv_to_json(hapfreq_file_path, json_file_path, schema_file_path, metadata_file_path):
    # Load the metadata JSON to understand the structure of metaData
    with open(metadata_file_path, 'r', encoding='utf-8') as metadata_file:
        metadata_data = json.load(metadata_file)

    # Extract metaData from metadata JSON
    meta_data = metadata_data["metaData"]

    # Initialize frequencyData list
    frequency_data = []

    # Read CSV file and convert rows to required format
    with open(hapfreq_file_path, mode='r', encoding='utf-8') as hapfreq_file:
        csv_reader = csv.reader(hapfreq_file)
        for row in csv_reader:
            haplotype, frequency = row[0], float(row[1])
            frequency_data.append({
                "haplotype": haplotype,
                "frequency": frequency
            })

    # Create final JSON structure
    final_json_data = {
        "metaData": meta_data,
        "frequencyData": frequency_data
    }

    # Write to output JSON file
    with open(json_file_path, 'w', encoding='utf-8') as json_file:
        json.dump(final_json_data, json_file, indent=4)

# File path defaults
hapfreq_file = '../data/US_CAU.freqs'
json_file = './hfx.json'
schema_file = './hfx.schema.json'
metadata_file = './hfx.metadata.json'

parser = argparse.ArgumentParser(description='configfile')
parser.add_argument('--conf', default='config.json')
args = parser.parse_args()

if os.path.exists(args.conf):
    with open(args.conf, 'rt') as f:
        config = json.load(f)

if 'hapfreq_file' in config.keys() and config['hapfreq_file']:
    hapfreq_file = config['hapfreq_file']
if 'json_file' in config.keys() and config['json_file']:
    json_file = json_file
if 'schema_file' in config.keys() and config['schema_file']:
    schema_file = config['schema_file']
if 'metadata_file' in config.keys() and config['metadata_file']:
    metadata_file = config['metadata_file']

# Convert CSV to JSON using the schema and example
csv_to_json(hapfreq_file, json_file, schema_file, metadata_file)

