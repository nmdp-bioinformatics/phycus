#!/usr/bin/perl
use strict;
use warnings;
use lib 'lib';

use Data::Dumper;
use Getopt::Long;
use File::Basename;

use WWW::SwaggerClient::PopulationApi;
use WWW::SwaggerClient::Object::PopulationRequest;

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

my $api_instance = WWW::SwaggerClient::PopulationApi->new();
my $population_request = WWW::SwaggerClient::Object::PopulationRequest->new(); # PopulationRequest | Population Request
$population_request->{name} = "CAU-US";
$population_request->{description} = "US Caucasian";

$api_instance->{api_client}->{config}{base_url} = $base;
$api_instance->{api_client}->{ua}->env_proxy;

eval {
    my $result = $api_instance->create_population(population_request => $population_request);
    print Dumper($result);
    my $popId = $result->{id};
    print "The Population ID is ${popId}\n";
};
if ($@) {
    warn "Exception when calling PopulationApi->create_population: $@\n";
}
