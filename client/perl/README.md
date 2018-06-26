## Haplotype Frequency Curation Service Perl Client

### Required Modules
Install the following Perl libraries.

- Module::Find
- URI::Query
- Log::Any
- Module::Runtime
- Class::Singleton
- Date::Parse
- DateTime
- Moose::Role
- LWP::UserAgent
- Class::Accessor
- JSON

### Install API
Generate and build the API. The current client was tested with the swagger
generator version `2.3.1`.

#### For macOS
Requires the `swagger-codegen` tool from homebrew. May require sudo. 
```
sudo make
```

#### For Windows
Using the powershell:
```ps1
Invoke-WebRequest -OutFile swagger-codegen-cli.jar http://central.maven.org/maven2/io/swagger/swagger-codegen-cli/2.3.1/swagger-codegen-cli-2.3.1.jar
java -jar swagger-codegen-cli.jar generate --lang perl --input-spec ..\..\curation-swagger-spec.yaml
```

### Test the API 
Create a sample population.
```bash
perl Population-client.pl
```

Push a frequency file to local instance of Phycus
```bash
perl HFCuS-client.pl --local --action push data/US_CAU.freqs
```

See all the submissions
```bash
perl HFCuS-client.pl --local --action=get_all
```

Get the frequency for 1 submission.
```bash
perl HFCuS-client.pl --local --action=get_sub -sub 1
```


