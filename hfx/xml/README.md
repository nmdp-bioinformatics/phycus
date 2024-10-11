# Haplotype Frequency eXchange Converter

This Perl script generates an XML file containing haplotype frequency data from a csv file according to an XSD schema. It takes a config file for input and outputs an XML either to the screen or to a specified file.

## Requirements

Ensure the following Perl modules are installed:
- `Text::CSV`
- `XML::Writer`
- `XML::LibXML`
- `Getopt::Long`
- `IO::File`

You can install these via CPAN:
```bash
cpan install Text::CSV XML::Writer XML::LibXML Getopt::Long IO::File

