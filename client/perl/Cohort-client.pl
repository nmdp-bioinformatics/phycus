#!/usr/bin/perl
use strict;
use warnings;
use lib 'lib';

use Data::Dumper;
use Getopt::Long;
use File::Basename;

use WWW::SwaggerClient::CohortApi;
use WWW::SwaggerClient::Object::CohortRequest;

my $base = "http://phycus.b12x.org:8080";
my $opt_local;

my $prg = basename($0);

if (
   !&GetOptions(
      "local"    => \$opt_local,
   )
   )
{
   print "\n$prg: wrong option\n";
   exit 1;
}

if($opt_local) {
    $base = "http://localhost:8080";
}

my $api_instance = WWW::SwaggerClient::CohortApi->new();
my $genotype_list = WWW::SwaggerClient::Object::GenotypeList->new();
my $cohort_request = WWW::SwaggerClient::Object::CohortRequest->new();
my $cohort_data = WWW::SwaggerClient::Object::CohortData->new();
$cohort_data->{name} = "Cohort1";
$cohort_data->{genotype_list} = $genotype_list;

$cohort_request->{cohort_data} = $cohort_data;

$api_instance->{api_client}->{config}{base_url} = $base;
$api_instance->{api_client}->{ua}->env_proxy;

eval {
    my $result = $api_instance->create_cohort(cohort_request => $cohort_request
);
    print Dumper($result);
    my $cohortId = $result->{id};
    print "The Cohort ID is ${cohortId}\n";
};
if ($@) {
    warn "Exception when calling CohortApi->create_cohort: $@\n";
}
