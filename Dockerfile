FROM maven:3.5-jdk-8

MAINTAINER Jason Brelsford or (jbrelsf@nmdp.org)
MAINTAINER Florian Scheel or (florian.scheel@zkrd.de)

EXPOSE 8080

WORKDIR /src
COPY . /src
RUN mvn clean package

WORKDIR /app
RUN cp /src/target/service-haplotype-frequency-curation-0.0.1.jar /app/service-haplotype-frequency-curation-0.0.1.jar
COPY bash-start-java-tomcat.sh /app/bash-start-java-tomcat.sh

RUN rm -rf /src

ENTRYPOINT ["/app/bash-start-java-tomcat.sh"]
