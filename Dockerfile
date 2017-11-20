FROM openjdk:8 

MAINTAINER Jason Brelsford or (jbrelsf@nmdp.org)

WORKDIR /app

EXPOSE 8080

COPY ./target/service-haplotype-frequency-curation-0.0.1.jar /app/service-haplotype-frequency-curation-0.0.1.jar
COPY bash-start-java-tomcat.sh /app/bash-start-java-tomcat.sh
