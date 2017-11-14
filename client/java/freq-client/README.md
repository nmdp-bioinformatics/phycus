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
import io.swagger.client.api.DefaultApi;

import java.io.File;
import java.util.*;

public class DefaultApiExample {

    public static void main(String[] args) {
        
        DefaultApi apiInstance = new DefaultApi();
        try {
            HFCurationListResponse result = apiInstance.hfcGet();
            System.out.println(result);
        } catch (ApiException e) {
            System.err.println("Exception when calling DefaultApi#hfcGet");
            e.printStackTrace();
        }
    }
}

```

## Documentation for API Endpoints

All URIs are relative to *https://localhost*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*DefaultApi* | [**hfcGet**](docs/DefaultApi.md#hfcGet) | **GET** /hfc | 
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
*PopulationAPIApi* | [**createPopulation**](docs/PopulationAPIApi.md#createPopulation) | **POST** /population | Create Population
*PopulationAPIApi* | [**getAllPopulations**](docs/PopulationAPIApi.md#getAllPopulations) | **GET** /population | Get a list of all populations
*PopulationAPIApi* | [**getPopulationForId**](docs/PopulationAPIApi.md#getPopulationForId) | **GET** /population/{populationId} | Get Population Given an Id


## Documentation for Models

 - [AccessData](docs/AccessData.md)
 - [CohortData](docs/CohortData.md)
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



