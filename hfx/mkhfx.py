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



def csv_to_json(csv_file_path, json_file_path, schema_file_path, example_file_path):
    # Load the example JSON to understand the structure of metaData
    with open(example_file_path, 'r', encoding='utf-8') as example_file:
        example_data = json.load(example_file)

    # Extract metaData from example JSON
    meta_data = example_data["metaData"]

    # Initialize frequencyData list
    frequency_data = []

    # Read CSV file and convert rows to required format
    with open(csv_file_path, mode='r', encoding='utf-8') as csv_file:
        csv_reader = csv.reader(csv_file)
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
csv_file = '../data/US_CAU.freqs'
json_file = './hfx.json'
schema_file = './hfx.schema.json'
example_file = './hfx.example.json'

parser = argparse.ArgumentParser(description='configfile')
parser.add_argument('--conf', default='mkhfx.json')
args = parser.parse_args()

if os.path.exists(args.conf):
    with open(args.conf, 'rt') as f:
        config = json.load(f)

if csv_file in config.keys() and config['csv_file']:
    csv_file = config['csv_file']
if config['json_file']:
    json_file = json_file
if config['schema_file']:
    schema_file = config['schema_file']
if config['example_file']:
    example_file = config['example_file']

# Convert CSV to JSON using the schema and example
csv_to_json(csv_file, json_file, schema_file, example_file)

