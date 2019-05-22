# Data requirements

This is a work in progress determining how to format data for upload.

* Do not include a header
* There can be no empty lines in the middle of the data. (A blank line at the end seems to be fine.)
* no spaces between the commas and the next set of data. ("OTH,HLA-A*01:01,0.25" as opposed to "OTH, HLA-A*01:01, 0.25")
* The frequencies in the file should total 1.0000 (1.00001 is fine, 1.0001 is not.)
* Haplotypes should be separated by tildas (~).

See demo_PHYCUS_HFs.csv for an example.
