# swagger-java-client

## Requirements

Building the API client library requires [Maven](https://maven.apache.org/) to be installed.

## Installation

To install the API client library to your local Maven repository, simply execute:

```shell
mvn install
```

To deploy it to a remote Maven repository instead, configure the settings of the repository and execute:

```shell
mvn deploy
```

Refer to the [official documentation](https://maven.apache.org/plugins/maven-deploy-plugin/usage.html) for more information.

### Maven users

Add this dependency to your project's POM:

```xml
<dependency>
    <groupId>io.swagger</groupId>
    <artifactId>swagger-java-client</artifactId>
    <version>1.0.0</version>
    <scope>compile</scope>
</dependency>
```

### Gradle users

Add this dependency to your project's build file:

```groovy
compile "io.swagger:swagger-java-client:1.0.0"
```

### Others

At first generate the JAR by executing:

    mvn package

Then manually install the following JARs:

* target/swagger-java-client-1.0.0.jar
* target/lib/*.jar

## Getting Started

Please follow the [installation](#installation) instruction and execute the following Java code:

```java

import io.swagger.client.*;
import io.swagger.client.auth.*;
import io.swagger.client.model.*;
import io.swagger.client.api.CohortApi;

import java.io.File;
import java.util.*;

public class CohortApiExample {

    public static void main(String[] args) {
        
        CohortApi apiInstance = new CohortApi();
        CohortRequest cohortRequest = new CohortRequest(); // CohortRequest | Cohort Request
        try {
            CohortData result = apiInstance.createCohort(cohortRequest);
            System.out.println(result);
        } catch (ApiException e) {
            System.err.println("Exception when calling CohortApi#createCohort");
            e.printStackTrace();
        }
    }
}

```

## Documentation for API Endpoints

All URIs are relative to *https://localhost*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*CohortApi* | [**createCohort**](docs/CohortApi.md#createCohort) | **POST** /cohort | Create Cohort
*CohortApi* | [**getAllCohorts**](docs/CohortApi.md#getAllCohorts) | **GET** /cohort | Get a list of all cohorts
*CohortApi* | [**getCohortForId**](docs/CohortApi.md#getCohortForId) | **GET** /cohort/{cohortId} | Get Cohort Given an Id
*DefaultApi* | [**hfcGet**](docs/DefaultApi.md#hfcGet) | **GET** /hfc | 
*DefaultApi* | [**hfcLabelGet**](docs/DefaultApi.md#hfcLabelGet) | **GET** /hfc/label | 
*DefaultApi* | [**hfcPopulationGet**](docs/DefaultApi.md#hfcPopulationGet) | **GET** /hfc/population | 
*DefaultApi* | [**hfcPopulationPopulationIdGet**](docs/DefaultApi.md#hfcPopulationPopulationIdGet) | **GET** /hfc/population/{populationId} | 
*DefaultApi* | [**hfcPost**](docs/DefaultApi.md#hfcPost) | **POST** /hfc | 
*DefaultApi* | [**hfcSubmissionIdCohortGet**](docs/DefaultApi.md#hfcSubmissionIdCohortGet) | **GET** /hfc/{submissionId}/cohort | 
*DefaultApi* | [**hfcSubmissionIdDelete**](docs/DefaultApi.md#hfcSubmissionIdDelete) | **DELETE** /hfc/{submissionId} | 
*DefaultApi* | [**hfcSubmissionIdGet**](docs/DefaultApi.md#hfcSubmissionIdGet) | **GET** /hfc/{submissionId} | 
*DefaultApi* | [**hfcSubmissionIdHaplotypesGet**](docs/DefaultApi.md#hfcSubmissionIdHaplotypesGet) | **GET** /hfc/{submissionId}/haplotypes | 
*DefaultApi* | [**hfcSubmissionIdLabelsGet**](docs/DefaultApi.md#hfcSubmissionIdLabelsGet) | **GET** /hfc/{submissionId}/labels | 
*DefaultApi* | [**hfcSubmissionIdPopulationGet**](docs/DefaultApi.md#hfcSubmissionIdPopulationGet) | **GET** /hfc/{submissionId}/population | 
*DefaultApi* | [**hfcSubmissionIdScopeGet**](docs/DefaultApi.md#hfcSubmissionIdScopeGet) | **GET** /hfc/{submissionId}/scope | 
*PopulationApi* | [**createPopulation**](docs/PopulationApi.md#createPopulation) | **POST** /population | Create Population
*PopulationApi* | [**getAllPopulations**](docs/PopulationApi.md#getAllPopulations) | **GET** /population | Get a list of all populations
*PopulationApi* | [**getPopulationForId**](docs/PopulationApi.md#getPopulationForId) | **GET** /population/{populationId} | Get Population Given an Id


## Documentation for Models

 - [AccessData](docs/AccessData.md)
 - [CohortData](docs/CohortData.md)
 - [CohortRequest](docs/CohortRequest.md)
 - [CohortResponse](docs/CohortResponse.md)
 - [Error](docs/Error.md)
 - [FrequencyError](docs/FrequencyError.md)
 - [Genotype](docs/Genotype.md)
 - [GenotypeList](docs/GenotypeList.md)
 - [GenotypeMethod](docs/GenotypeMethod.md)
 - [HFCurationListResponse](docs/HFCurationListResponse.md)
 - [HFCurationRequest](docs/HFCurationRequest.md)
 - [HFCurationResponse](docs/HFCurationResponse.md)
 - [HaplotypeFrequency](docs/HaplotypeFrequency.md)
 - [HaplotypeFrequencyData](docs/HaplotypeFrequencyData.md)
 - [Label](docs/Label.md)
 - [LabelData](docs/LabelData.md)
 - [LabelList](docs/LabelList.md)
 - [LabelResponse](docs/LabelResponse.md)
 - [License](docs/License.md)
 - [Method](docs/Method.md)
 - [MethodData](docs/MethodData.md)
 - [MethodList](docs/MethodList.md)
 - [PopulationData](docs/PopulationData.md)
 - [PopulationRequest](docs/PopulationRequest.md)
 - [PopulationResponse](docs/PopulationResponse.md)
 - [PopulationSubmissionData](docs/PopulationSubmissionData.md)
 - [PopulationSubmissionResponse](docs/PopulationSubmissionResponse.md)
 - [Quality](docs/Quality.md)
 - [ResolutionData](docs/ResolutionData.md)
 - [ResolutionInfo](docs/ResolutionInfo.md)
 - [ScopeData](docs/ScopeData.md)
 - [ScopeElement](docs/ScopeElement.md)


## Documentation for Authorization

All endpoints do not require authorization.
Authentication schemes defined for the API:

## Recommendation

It's recommended to create an instance of `ApiClient` per thread in a multithreaded environment to avoid any potential issues.

## Author



