#!/bin/bash

echo $MYSQL_DATABASE_URL
echo $MYSQL_USER
echo $MYSQL_PASSWORD
sleep 10
#java -Dspring.datasource.url="jdbc:mysql://db:3306/hfcusdb" -Dspring.datasource.username="hfcus_user" -Dspring.datasource.password="hfcus_user1" -jar /app/service-haplotype-frequency-curation-0.0.1.jar
java -Dspring.datasource.url="$MYSQL_DATABASE_URL" -Dspring.datasource.username="$MYSQL_USER" -Dspring.datasource.password="$MYSQL_PASSWORD" -jar /app/service-haplotype-frequency-curation-0.0.1.jar
