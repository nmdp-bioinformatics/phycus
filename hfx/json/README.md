## hfx - haplotype frequency exchange

To run: 
`python mkhfx.py` 

Needs installation of requests, pandas, jsonschema, py-ard

This script will read the config file to get the actual file paths to produce hfx output
There are two different configs activating different modes of the program:
- `config.json`: Should contain the path to a json file with haplotype frequencies and a json file with its metadata to produce the `.hfx` file from both.
- `config_afnd.json`: Should contain the URL to a print results page of haplotype frequencies on allelefrequencies.net ([Example](https://www.allelefrequencies.net/hla6003a_scr.asp?hla_selection=&hla_locus1=&hla_locus2=&hla_locus3=&hla_locus4=&hla_locus5=&hla_locus6=&hla_locus7=&hla_locus8=&hla_population=1488&hla_country=&hla_dataset=&hla_region=&hla_ethnic=&hla_study=&hla_sample_size=&hla_sample_size_pattern=equal&hla_sample_year=&hla_sample_year_pattern=equal&hla_loci=&hla_order=order_1)). The frequencies are scraped from the webpage and also outputted into a `.hfx` file.

Files within this folder:

| file            |   description |
|-----------------|---------------|
| config.json        | config file containing paths listed to the files below |	
| config_afnd.json        | config file containing a allelefrequencies.net url |	
| hfx.metadata.json |		the metadata file in hfx format |
| hf.csv | the frequencies file as two ',' separated columns without a header |
| hfx.json		 | the output file with the two files above combined|
| hfx.schema.json |		the hfx schema. Not actually used yet by `mkhfx.py` |
| requirements.txt |		the python packages needed in order to run `mkhfx.py`. Install using pip |

Possible fields in a `config.json` file:
| field            |   description |
|-----------------|---------------|
| hapfreq_path        | path to either local hf frequencies or a allelefrequencies.net print results page |	
| metadata_file        | path to metadata file to combine with local hf frequencies. Not needed for allelefrequencies.net input |	
| output_hfx_file | the path for the output `.hfx` file |
| schema_file		 | the schema file to derive the ``.hfx` structure from for validation. No used in the code yet |

Maiers
2024-10-11

Ramon
2024-10-11
