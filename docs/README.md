# User Guide for PHYCuS



## General Ideas
We have implemented a Public Haplotype Frequency Curation Service (PHYCuS).  The goal is to address the several unmet needs in the field for applications that consume HLA Haplotype Frequency data:

 - standard input formats for genotypes and output formats for haplotypes
 - standard representations of ambiguity (MAC, GL)
 - standard validation of HLA
 - globally unique IDs (GUIDs) to refer to "populations", "cohorts" and the one-to-many relationship between them
 - access control with appropriate licensing agreements
 - automated access (REST API not clickthrough pages)
 - quality metrics
 - standardized metadata
 

## Implementation of ideas in PHYCuS

The development of PHYCuS started with the definition of a [swagger specification](../curation-swagger-spec.yaml)

## Installation

See top level [README.md](../README.md)

