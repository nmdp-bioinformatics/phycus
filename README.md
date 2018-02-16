# Haplotype Frequency Curation

Service to help curate Haplotype Frequencies.

## Development Overview  

### Pre-requisites:
 - [JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
 - [Apache Maven](http://maven.apache.org)
 - [Docker](http://docker.com)

### Build the application

```bash
mvn clean package
```

### Setup Database

The project is setup to use mysql Docker instance for local development.
```bash
docker-compose up -d
```
The phpMyAdmin page should be available at [http://localhost:9999/](http://localhost:9999/)
Login with `hfcus_user` user and `hfcus_user1` as password.

Use `docker-compose stop` and `docker-compose rm` to stop and remove the db containers.

### Run the application
Start your server as a simple java application  
Check your JDK version with `java -version`

With Java 8:
```bash
 java -jar target/service-haplotype-frequency-curation-0.0.1.jar
```

With Java 9:
```bash
java --add-modules java.xml.bind -jar target/service-haplotype-frequency-curation-0.0.1.jar
```

You can view the api documentation in swagger-ui by pointing to  [http://localhost:8080](http://localhost:8080/)

### Using the service
See [client/] directory for examples on using it from various languages. Eg. for [Perl](client/perl)

