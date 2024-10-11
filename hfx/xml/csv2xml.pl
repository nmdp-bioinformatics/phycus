#!/usr/bin/perl
use strict;
use warnings;
use Text::CSV;
use XML::Writer;
use XML::LibXML;
use IO::File;
use Getopt::Long;

# Default paths (optional)
my $csv_file;
my $config_file;
my $output_xml_file;
my $xsd_file = 'hfx_schema.xsd'; # Default XSD file (update the path as needed)

# Optional command-line arguments
GetOptions(
    'csv=s'    => \$csv_file,
    'config=s' => \$config_file,
    'output=s' => \$output_xml_file
) or die "Usage: $0 [--csv <haplotype_csv_file>] [--config <config_file>] [--output <output_xml_file>]\n";

# 1) Read optional config file for meta data, or use defaults
my %config = (
    method      => 'Unknown',
    parameter   => 'Unknown',
    value       => 'Unknown',
    geoCode     => 'Unknown',
    ethnicity   => 'Unknown',
    inputSize   => '0',
    kind        => 'Unknown',
    version     => 'Unknown'
);

# If config file is provided, override default metadata with its values
my @output_resolutions;
my @parameters;
if ($config_file) {
    open my $cfg_fh, '<', $config_file or die "Cannot open config file: $!";
    my ($current_locus, $current_resolution, $current_parameter, $current_value);
    while (<$cfg_fh>) {
        chomp;
        my ($key, $value) = split(/\s*=\s*/, $_);
        if ($key eq 'locus') {
            $current_locus = $value;
        } elsif ($key eq 'resolution') {
            $current_resolution = $value;
        } elsif ($key eq 'parameter') {
            $current_parameter = $value;
        } elsif ($key eq 'value') {
            $current_value = $value;
        }

        # Collect locus-resolution pairs
        if ($current_locus && $current_resolution) {
            push @output_resolutions, { locus => $current_locus, resolution => $current_resolution };
            $current_locus = undef;
            $current_resolution = undef;
        }

        # Collect parameter-value pairs
        if ($current_parameter && $current_value) {
            push @parameters, { parameter => $current_parameter, value => $current_value };
            $current_parameter = undef;
            $current_value = undef;
        }

        # Other general config values
        $config{$key} = $value unless $key eq 'locus' || $key eq 'resolution' || $key eq 'parameter' || $key eq 'value';
    }
    close $cfg_fh;
}
# If no locus/resolution pairs are found, add default pair
if (!@output_resolutions) {
    push @output_resolutions, { locus => 'HLA-DRB1', resolution => '2-Field' };
}





# 2) Read and parse CSV file if provided, or use an empty dataset
my @haplotype_data;
if ($csv_file) {
    my $csv = Text::CSV->new({ binary => 1 });
    open my $csv_fh, '<', $csv_file or die "Cannot open CSV file: $!";
    while (my $row = $csv->getline($csv_fh)) {
        my ($haplotype, $frequency) = @$row;
        push @haplotype_data, { haplotype => $haplotype, frequency => $frequency };
    }
    close $csv_fh;
}

# 3) Prepare output destination (file or stdout)
my $output;
if ($output_xml_file) {
    $output = IO::File->new(">$output_xml_file");
} else {
    $output = *STDOUT;
}

# 4) Generate XML based on XSD and CSV data (or empty frequency section if no CSV)
my $writer = XML::Writer->new(OUTPUT => $output, DATA_MODE => 1, DATA_INDENT => 4);

$writer->xmlDecl('UTF-8');
$writer->startTag('hfxHaplotypeList');

# Add metadata from config (or defaults if config file not provided)
$writer->startTag('metaData');


# OutputResolution (multiple locus/resolution pairs)
$writer->startTag('outputResolution');
foreach my $res (@output_resolutions) {
    $writer->startTag('resolutionPair');
    $writer->dataElement('locus', $res->{locus});
    if ($res->{resolution}) {
        $writer->dataElement('resolution', $res->{resolution});
    }
    $writer->endTag('resolutionPair');
}
$writer->endTag('outputResolution');


# hfeMethod
$writer->startTag('hfeMethod');
$writer->dataElement('method', $config{'method'});
# Add all parameter-value pairs
$writer->startTag('parameters');
foreach my $param (@parameters) {
    $writer->startTag('parameterPair');
    $writer->dataElement('parameter', $param->{parameter});
    $writer->dataElement('value', $param->{value});
    $writer->endTag('parameterPair');
}
$writer->endTag('parameters');
$writer->endTag('hfeMethod');

# cohortDescription
$writer->startTag('cohortDescription');
$writer->startTag('population');
$writer->dataElement('geoCode', $config{'geoCode'});
$writer->dataElement('ethnicity', $config{'ethnicity'});
$writer->dataElement('species', $config{'species'});
$writer->dataElement('description', $config{'description'});
$writer->endTag('population');
$writer->dataElement('inputSize', $config{'inputSize'});
$writer->endTag('cohortDescription');

# nomenclatureUsed
$writer->startTag('nomenclatureUsed');
$writer->dataElement('kind', $config{'kind'});
$writer->dataElement('version', $config{'version'});
$writer->endTag('nomenclatureUsed');

$writer->endTag('metaData');

# Add haplotype frequency data if CSV was provided, otherwise skip
$writer->startTag('frequencyData');
if (@haplotype_data) {
    foreach my $data (@haplotype_data) {
        $writer->startTag('frequencyPair');
        $writer->dataElement('haplotype', $data->{haplotype});
        $writer->dataElement('frequency', $data->{frequency});
        $writer->endTag('frequencyPair');
    }
}
$writer->endTag('frequencyData');

$writer->endTag('hfxHaplotypeList');
$writer->end();

$output->close if $output_xml_file;
# exit;
# 5) Validate the generated XML against the XSD
if ($output_xml_file) {
    my $schema = XML::LibXML::Schema->new(location => $xsd_file);

    # Load the generated XML file
    my $doc = XML::LibXML->load_xml(location => $output_xml_file);

    # Perform validation
    eval { $schema->validate($doc); };
    
    if ($@) {
        die "XML validation failed: $@\n";
    } else {
        print "XML successfully validated against the schema!\n";
    }
}
