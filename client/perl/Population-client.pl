use Data::Dumper;
use WWW::SwaggerClient::Configuration;
<<<<<<< HEAD
use WWW::SwaggerClient::PopulationApi;
=======
use WWW::SwaggerClient::PopulationApiApi;
>>>>>>> refs/remotes/upstream/master
use WWW::SwaggerClient::Object::PopulationRequest;

<<<<<<< HEAD
my $api_instance = WWW::SwaggerClient::PopulationApi->new();
=======
my $api_instance = WWW::SwaggerClient::PopulationApiApi->new();
>>>>>>> refs/remotes/upstream/master
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
<<<<<<< HEAD
    warn "Exception when calling PopulationApi->create_population: $@\n";
=======
    warn "Exception when calling PopulationApiApi->create_population: $@\n";
>>>>>>> refs/remotes/upstream/master
}
