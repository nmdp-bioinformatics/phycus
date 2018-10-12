# PopulationApi

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createPopulation**](PopulationApi.md#createPopulation) | **POST** /population | Create Population
[**getAllPopulations**](PopulationApi.md#getAllPopulations) | **GET** /population | Get a list of all populations
[**getPopulationForId**](PopulationApi.md#getPopulationForId) | **GET** /population/{populationId} | Get Population Given an Id


<a name="createPopulation"></a>
# **createPopulation**
> PopulationData createPopulation(populationRequest)

Create Population

### Example
```java
// Import classes:
//import io.swagger.client.ApiException;
//import io.swagger.client.api.PopulationApi;


PopulationApi apiInstance = new PopulationApi();
PopulationRequest populationRequest = new PopulationRequest(); // PopulationRequest | Population Request
try {
    PopulationData result = apiInstance.createPopulation(populationRequest);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling PopulationApi#createPopulation");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **populationRequest** | [**PopulationRequest**](PopulationRequest.md)| Population Request |

### Return type

[**PopulationData**](PopulationData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getAllPopulations"></a>
# **getAllPopulations**
> PopulationResponse getAllPopulations()

Get a list of all populations

### Example
```java
// Import classes:
//import io.swagger.client.ApiException;
//import io.swagger.client.api.PopulationApi;


PopulationApi apiInstance = new PopulationApi();
try {
    PopulationResponse result = apiInstance.getAllPopulations();
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling PopulationApi#getAllPopulations");
    e.printStackTrace();
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**PopulationResponse**](PopulationResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a name="getPopulationForId"></a>
# **getPopulationForId**
> PopulationData getPopulationForId(populationId)

Get Population Given an Id

### Example
```java
// Import classes:
//import io.swagger.client.ApiException;
//import io.swagger.client.api.PopulationApi;


PopulationApi apiInstance = new PopulationApi();
Long populationId = 789L; // Long | Population ID
try {
    PopulationData result = apiInstance.getPopulationForId(populationId);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling PopulationApi#getPopulationForId");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **populationId** | **Long**| Population ID |

### Return type

[**PopulationData**](PopulationData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

