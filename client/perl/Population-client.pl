use Data::Dumper;
use WWW::SwaggerClient::Configuration;
use WWW::SwaggerClient::PopulationAPIApi;
use WWW::SwaggerClient::Object::PopulationRequest;

my $api_instance = WWW::SwaggerClient::PopulationAPIApi->new();
my $population_request = WWW::SwaggerClient::Object::PopulationRequest->new(); # PopulationRequest | Population Request
$population_request->{name} = "CAU-US";
$population_request->{description} = "US Caucasian";

$api_instance->{api_client}->{base_url} = 'http://localhost:8080';

eval {
    my $result = $api_instance->create_population(population_request => $population_request);
    print Dumper($result);
    my $popId = $result->{id};
    print "The Population ID is ${popId}\n";
};
if ($@) {
    warn "Exception when calling PopulationAPIApi->create_population: $@\n";
}
