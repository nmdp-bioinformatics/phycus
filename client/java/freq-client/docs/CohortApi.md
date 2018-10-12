# CohortApi

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createCohort**](CohortApi.md#createCohort) | **POST** /cohort | Create Cohort
[**getAllCohorts**](CohortApi.md#getAllCohorts) | **GET** /cohort | Get a list of all cohorts
[**getCohortForId**](CohortApi.md#getCohortForId) | **GET** /cohort/{cohortId} | Get Cohort Given an Id


<a name="createCohort"></a>
# **createCohort**
> CohortData createCohort(cohortRequest)

Create Cohort

### Example
```java
// Import classes:
//import io.swagger.client.ApiException;
//import io.swagger.client.api.CohortApi;


CohortApi apiInstance = new CohortApi();
CohortRequest cohortRequest = new CohortRequest(); // CohortRequest | Cohort Request
try {
    CohortData result = apiInstance.createCohort(cohortRequest);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling CohortApi#createCohort");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cohortRequest** | [**CohortRequest**](CohortRequest.md)| Cohort Request |

### Return type

[**CohortData**](CohortData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getAllCohorts"></a>
# **getAllCohorts**
> CohortResponse getAllCohorts()

Get a list of all cohorts

### Example
```java
// Import classes:
//import io.swagger.client.ApiException;
//import io.swagger.client.api.CohortApi;


CohortApi apiInstance = new CohortApi();
try {
    CohortResponse result = apiInstance.getAllCohorts();
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling CohortApi#getAllCohorts");
    e.printStackTrace();
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**CohortResponse**](CohortResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a name="getCohortForId"></a>
# **getCohortForId**
> CohortData getCohortForId(cohortId)

Get Cohort Given an Id

### Example
```java
// Import classes:
//import io.swagger.client.ApiException;
//import io.swagger.client.api.CohortApi;


CohortApi apiInstance = new CohortApi();
Long cohortId = 789L; // Long | Cohort ID
try {
    CohortData result = apiInstance.getCohortForId(cohortId);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling CohortApi#getCohortForId");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cohortId** | **Long**| Cohort ID |

### Return type

[**CohortData**](CohortData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

