# Authentication and Authorization on PhyCuS HFC App

[KeyCloak](http://www.keycloak.org) was chosen as the Web-SSO solution to provide Authentication and Authorization on NMDP applications.

KeyCloak is based on OAuth2 and OpenConnectId protocols to generate and handle the exchange of "JWT - JSON Web Tokens" between the OAuthServer/OIDC Server, Resources and Client Applications. We recommend the reading of KeyCloak documentation. 

PhyCuS-HFC Application was setup to use "Spring Security" and its submodules to integrate to KeyCloak.

Then before running PhyCuS-HFC App, some infrastructure services should be already started. See how to make them work properly in the next section.

## Running KeyCloak

### Pre-requisites:
 - [Docker Compose](https://docs.docker.com/compose/) version 1.8.0+

In the Development Environment, KeyCloak and its dependencies services can be run in Docker Containers throughout Docker-Compose. Follow the steps below:

- Clone the project: [PhyCus (forked by developer Andre Nascimento)](https://github.com/scout23DF/phycus.git)
- Make sure you are at the right branch where there's the implementation of KeyCloak setup;   
- Aiming to get PhyCuS and KeyCloak databases already created and loaded before to start KeyCloak Container, do this:

  * Find and unzip the file below: 
     * `[project-dir]/src/main/docker/backups-docker-volumes/docker-volumes-bkp-[newest-date].zip`
     * to some folder you have write rights. (e.g.: your `User's Home` folder's root);
  * Open and edit the file: `[project-dir]/src/main/docker/.env`;
  * Change all Volume path's in each Environment Variable, point to the folder where you've unzipped the backup file mentioned earlier, like this:
    * `VOLUME_MYSQL_SRV_01_DATA_PATH={Folder Where You Extracted the ZIP Backup File}/docker-volumes/mysql-srv-01/data/`

- Build and start the Docker containers issuing the following command:
````
> [project-dir]/src/main/docker/clear && docker-compose up
````  
- If each container has started properly, then you have the following services:

````
> Port 3306 : MySQL Instance for PhyCuS-HFC App database
> Port 3307 : MySQL Instance for KeyCloak database;
> Port 9999 : PhpMyAdmin tool;
> Ports  25 / 465 / 587: MailServer
> Port 9080 : KeyCloak Admin Console;
````
  
- Log in KeyCloak Admin Console:

````
* URL:      http://localhost:9080/auth
* User:     admin
* Password: Pa55w0rd
````
       
- Navigate in this console and inspect the Realm, Clients, Roles, Groups and Users created for Testing purposes.

### The Policy of Authentication and Authorization Created in KeyCloak

Read this document [Draft of CIBMTR/NMDP Authentication and Authorization Policy](https://docs.google.com/document/d/1uDIZsbA3-jcGpx8ilexdesU_-A6dmYVpbMqpquC7BEs/edit?pli=1) to comprehend the Policy of Authentication and Authorization Created in KeyCloak to enable Web-SSO for CIBMTR BioInformatics / NMDP / PhyCuS applications.

* 1 Realm called: CIBMTR-BioInformatics-Realm
* 2 Realm Compound Roles: 
  * ADMIN_GLOBAL_ROLE
  * BASIC_REGISTERED_GLOBAL_ROLE
* 1 Client App: 
  * PhycusSHFCApp (for Phycus App on the URL: http://172.17.0.1:8080/phycusApp)
* N Client Compound Roles: 
  * 01_SYSTEM_ADMINISTRATOR_CLIENT_ROLE
  * 02_APP_MANAGER_CLIENT_ROLE
  * 03_REVIEWER_CLIENT_ROLE
  * 04_PUBLISHER_CLIENT_ROLE
  * 05_REGISTERED_USERS_CLIENT_ROLE
  * 06_MEMBERS_OF_THE_STREET_CLIENT_ROLE
  * 99_API_CONSUMERS_APP_CLIENT_ROLE
* N Groups:
  * (See the hierarchy structure on the document file mentioned above)
* 7 Users assigned to Roles and Groups [login | password | Roles]: 
  * admin.master             | 123456 | ADMIN_GLOBAL_ROLE, 01_SYSTEM_ADMINISTRATOR_CLIENT_ROLE
  * sysadmin.phycus          | 123456 | 01_SYSTEM_ADMINISTRATOR_CLIENT_ROLE
  * manager.phycus           | 123456 | 02_APP_MANAGER_CLIENT_ROLE  
  * reviewer.phycus          | 123456 | 03_REVIEWER_CLIENT_ROLE  
  * publisher.phycus         | 123456 | 04_PUBLISHER_CLIENT_ROLE  
  * user01.phycus            | 123456 | 05_REGISTERED_USERS_CLIENT_ROLE  
  * ext-consumer-apis.phycus | 123456 | 99_API_CONSUMERS_APP_CLIENT_ROLE  
  
  These Groups and Users were created just for testing and validating purposes at this our first stage. The Policy Document must be improved to describe how the Authentication and Authorization process will work. 
  
## Building and Running the PhyCuS-HFC Application

- To build and run the PhyCuS-HFC Application perform the steps described in the [project-root]/[README.md](../../../README.md) file on project's root, however skip execution of "Setup Database" section because you already have the Phycus MySQL Database running.
- Make sure your docker IP is: `172.17.0.1`
  * Check issuing `ifconfig` and look for the IP in `docker0` entry.
- To check KeyCloak integration, open your browser and try to access the following URL's using one of the User listed above:
  * `http://172.17.0.1:8080/phycusApp/swagger-ui.html` : Required ROLE: 05_REGISTERED_USERS_CLIENT_ROLE
  * `http://172.17.0.1:8080/phycusApp/hfc` : Required ROLE: 04_PUBLISHER_CLIENT_ROLE
  * `http://172.17.0.1:8080/phycusApp/population` : Required ROLE: 03_REVIEWER_CLIENT_ROLE
  * `http://172.17.0.1:8080/phycusApp/cohort` : Required ROLE: 05_REGISTERED_USERS_CLIENT_ROLE     
- To logout from an User session, access the URL's below:
  * `http://172.17.0.1:8080/phycusApp/api/logout` 
  * `http://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm/protocol/openid-connect/logout`
- All URL Security constraints are set on this Spring Boot configuration class:
  * Class: `/src/main/java/org/nmdp/hfcus/configuration/SecurityConfiguration.java` 
  * Methods: `configure()`
    * Notes: In the next phases we will improve this Resource Authorization mechanism, making it more dynamic through URL mapping constraint in KeyCloak UMA settings. 

## Stopping All Services in Docker Containers

- Open other Terminal Session and issue:
  * To only Stop the Containers:
    * `docker-compose stop` 
  * To Stop and Destroy the Containers and its Volumes: 
    * `docker-compose down -v`
    * `docker-compose rm`

## Know Issues

  * The Logout procedure isn't working properky. It must be improved in the next Milestone.
