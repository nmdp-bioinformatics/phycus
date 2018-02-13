# Python HFCuS Client

## Install

Use `make` to generate and install the sample HFCus client package and scripts locally. 
`hfcus-import` and `hfcus-extract` scripts are installed in 
`api/bin`

Use `--help` option to get help.
```
$ api/bin/hfcus-import --help
usage: hfcus-import [-h] [-u URL] [-f FREQFILE] [-c CONFIG] [-v VERBOSE]

optional arguments:
  -h, --help            show this help message and exit
  -u URL, --url URL     HFCuS URL
  -f FREQFILE, --freqfile FREQFILE
                        Inpute frequency file
  -c CONFIG, --config CONFIG
                        Configuration file
  -v VERBOSE, --verbose VERBOSE
                        Option for running in verbose

```

See `config.json` for a sample config file. 
Make sure the population exists and is a valid id in config.json 
Eg. check [Population API http://localhost:8080/population](http://localhost:8080/population) for the ID. 

To locally import the frequencies:
```
api/bin/hfcus-import -u http://localhost:8080/ -f ../perl/data/US_CAU.freqs -c config.json
```

Similarly to extract:
```
 api/bin/hfcus-extract -u http://localhost:8080/ -s 1 -o hfcout.txt
```

