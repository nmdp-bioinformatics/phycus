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
cd db/
docker-compose up -d
```
The phpMyAdmin page should be available at [http://localhost:9999/](http://localhost:9999/). For Windows, you will need to use the IP of the docker VM instead of `localhost`. You can retrieve the IP with `docker-machine ip`. Usually it's `192.168.99.100`. 
Login with `hfcus_user` user and `hfcus_user1` as password.

Use `docker-compose stop` and `docker-compose rm` to stop and remove the db containers.

### Run the application

#### Special step on windows
On Windows, you need to start the server using the IP address Docker has assigned. Use `docker-machine ip` to retrieve it. You'll use it to replace `localhost` in `jdbc:mysql://localhost:3306/hfcusdb` when you start your server. (See the command below.)

#### Starting the application

Start your server as a simple java application  
Check your JDK version with `java -version`

With Java 8:
```bash
 java -jar target/service-haplotype-frequency-curation-0.0.1.jar
```

With Java 8 on Windows:
```bash
 java  -Dspring.datasource.url="jdbc:mysql://your-ip-address-here:3306/hfcusdb" -jar target/service-haplotype-frequency-curation-0.0.1.jar
```

With Java 9:
```bash
java --add-modules java.xml.bind -jar target/service-haplotype-frequency-curation-0.0.1.jar
```

You can view the api documentation in swagger-ui by pointing to  [http://localhost:8080](http://localhost:8080/)

### Using the service
See [client/](client/) directory for examples on using it from various languages. Eg. for [Perl](client/perl)

### Read the User Guide
See [docs/](docs/) directory for a user guide and examples of how the service is used in practice.
