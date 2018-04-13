#!/usr/bin/perl
use strict;
use warnings;
use lib 'lib';

use Getopt::Long;
use File::Basename;

# load the API package
use WWW::SwaggerClient::ApiFactory;

# load the models used
use WWW::SwaggerClient::Object::HFCurationResponse;
use WWW::SwaggerClient::Object::HFCurationRequest;
use WWW::SwaggerClient::Object::License;

# for displaying the API response data
use Data::Dumper;

#--- options and arguments:

my $opt_help;
my $opt_verbose = 0;
my $action      = "";
my $submission_id;
my $base = "http://phycus.b12x.org:8080"; 
# my $base = "http://hfcus.b12x.org:8080";
my $opt_local;


my $prg = basename($0);

if (
   !&GetOptions(
      "help"     => \$opt_help,
      "local"    => \$opt_local,
      "verbose!" => \$opt_verbose,     # -verbose, -noverbose
      "action=s" => \$action,
      "sub=s"    => \$submission_id,
   )
   )
{
   print "\n$prg: wrong option\n";
   exit 1;
}

if ($opt_help) {
   &help;
   exit 0;
}

if($opt_local) {
    $base = "http://localhost:8080";
}
print "Connecting to $base\n";

print "$prg: $action\n" if $opt_verbose;

if ( $action !~ /(get_sub|get_all|push|del_sub)/i ) {
   print "\n$prg: wrong action $action\n";
   exit 1;
}

if ( $action =~ /get_sub/i && !$submission_id ) {
   print "\n$prg: Submission ID missing for action $action\n";
   exit 1;
}

if ( $action =~ /del_sub/i && !$submission_id ) {
   print "\n$prg: Submission ID missing for action $action\n";
   exit 1;
}

my $api_instance = WWW::SwaggerClient::DefaultApi->new();
$api_instance->{api_client}->{config}{base_url} = $base;
$api_instance->{api_client}->{ua}->env_proxy;
print Dumper($api_instance) if $opt_verbose;

if ( $action eq "get_sub" ) {
   &get_haplotypes( $api_instance, $submission_id );
}
elsif ( $action eq "del_sub" ) {
   &delete_submission( $api_instance, $submission_id );
}
elsif ( $action eq "push" ) {
   my $file;
   if ( @ARGV == 1 ) {
      $file = $ARGV[0];
   }
   else {
      print "\n$prg: hfr file missing for action $action\n";
      exit 1;
   }
   &push_haplotypes( $api_instance, $file );
}
elsif ( $action eq "get_all" ) {
   &get_all_submissions($api_instance);
}
else {
   print "\n$prg: wrong action $action\n";
   exit 1;
}
exit 0;

# end of main

sub push_haplotypes {

   my ( $api_instance, $file ) = @_;

   my $HFCurReq = WWW::SwaggerClient::Object::HFCurationRequest->new();
   my $HapFreqData =
      WWW::SwaggerClient::Object::HaplotypeFrequencyData->new();
   my $PopData = WWW::SwaggerClient::Object::PopulationData->new();
   my $Lic     = WWW::SwaggerClient::Object::License->new();
   my $ResInfo = WWW::SwaggerClient::Object::ResolutionInfo->new();

   print Dumper($HapFreqData) if $opt_verbose;
   $Lic->{type_of_license}              = "CC0";
   $ResInfo->{resolution}               = "4-Field";
   $HapFreqData->{license}              = $Lic;
   $HapFreqData->{resolution_data}->[0] = $ResInfo;

   open( HFR, $file ) || die "$prg: Cannot open file $file: $!";
   my $i = 0;
   while (<HFR>) {
      chomp;
      my ( $hap, $hf ) = split /,/;
      my $HapFreq = WWW::SwaggerClient::Object::HaplotypeFrequency->new();
      $HapFreq->{haplotype_string}                   = $hap;
      $HapFreq->{frequency}                          = $hf;
      $HapFreqData->{haplotype_frequency_list}->[$i] = $HapFreq;
      $i++;
   }

   close HFR;

   # Use /population to create a new Population
   # See Population-client.pl
   # Use /cohort to create a new Cohort
   # See Cohort-client.pl
   $HFCurReq->{population_id} = 1;
   $HFCurReq->{cohort_id} = 1;
   $HFCurReq->{haplotype_frequency_data} = $HapFreqData;
   my $response = $api_instance->hfc_post( hf_curation_request => $HFCurReq );

   print "$0: Submission $response->{submission_id}\n";

}

sub delete_submission {
   my ( $api_instance, $submission_id ) = @_;
   eval {
      my $response = $api_instance->hfc_submission_id_delete(
         submission_id => $submission_id );
      print "Submission ID: " . $submission_id . " deleted.\n";
   };

   if ($@) {
      warn
         "Exception when calling DefaultApi->hfc_submission_id_delete: $@\n";
   }   
}



sub get_haplotypes {
   my ( $api_instance, $submission_id ) = @_;
   eval {
      my $haplotypes = $api_instance->hfc_submission_id_haplotypes_get(
         submission_id => $submission_id );
      print Dumper($haplotypes);
   };

   if ($@) {
      warn
         "Exception when calling DefaultApi->hfc_submission_id_haplotypes_get: $@\n";
   }
}    # end sub get_haplotypes

sub get_all_submissions {

   my ($api_instance) = @_;

   eval {
      my $result = $api_instance->hfc_get();
      print Dumper($result);
   };
   if ($@) {
      warn "Exception when calling DefaultApi->hfc_get: $@\n";
   }
}    # end of get_all_submissions

#=============================================================================
sub help {
#-----------------------------------------------------------------------------
# Called by: MAIN
#   Purpose: show help
# Arguments: none
#   Returns: nothing
#      ToDo:
#   Remarks:
#-----------------------------------------------------------------------------

   my $def_v = $opt_verbose ? "-- verbose" : "-- noverbose";

   print << "__END_OF_HELP__";
   
Name
   $prg
Purpose
   Client for HFCuS
Syntax
   $prg [--help]
   $prg [--verbose] --action=[get_sub|get_all|push|del_sub]
Options and arguments
   --help                show this help
   --[no]verbose         set verbose mode; default: $def_v
   --action              get_sub: getting HF set by submission ID -sub <submission_id>
                         push: push HF set <file>
                         get_all: get all submissions
                         del_sub: deleting HF set by submission ID -sub <submission_id>
   --local               connects to localhost:8080 as the server instead of http://phycus.b12x.org:8080
   The action push requires a file with HF data as argument.   
__END_OF_HELP__

   return;

}    # end sub help()
#=============================================================================

# end of file

