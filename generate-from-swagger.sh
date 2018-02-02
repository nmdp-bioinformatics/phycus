#!/usr/bin/env bash
# Install  swagger-codegen
# Show config options
# swagger-codegen config-help -l java
# Selective generation
# https://github.com/swagger-api/swagger-codegen#selective-generation
# swagger-codegen generate -i curation-swagger-spec.yaml -l spring -o . -c swagger-config.json -Dmodels -Dapis

echo "Not needed anymore. Maven will generate the sources when it builds the application."
