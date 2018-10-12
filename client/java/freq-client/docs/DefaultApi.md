# DefaultApi

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**hfcGet**](DefaultApi.md#hfcGet) | **GET** /hfc | 
[**hfcLabelGet**](DefaultApi.md#hfcLabelGet) | **GET** /hfc/label | 
[**hfcPopulationGet**](DefaultApi.md#hfcPopulationGet) | **GET** /hfc/population | 
[**hfcPopulationPopulationIdGet**](DefaultApi.md#hfcPopulationPopulationIdGet) | **GET** /hfc/population/{populationId} | 
[**hfcPost**](DefaultApi.md#hfcPost) | **POST** /hfc | 
[**hfcSubmissionIdCohortGet**](DefaultApi.md#hfcSubmissionIdCohortGet) | **GET** /hfc/{submissionId}/cohort | 
[**hfcSubmissionIdDelete**](DefaultApi.md#hfcSubmissionIdDelete) | **DELETE** /hfc/{submissionId} | 
[**hfcSubmissionIdGet**](DefaultApi.md#hfcSubmissionIdGet) | **GET** /hfc/{submissionId} | 
[**hfcSubmissionIdHaplotypesGet**](DefaultApi.md#hfcSubmissionIdHaplotypesGet) | **GET** /hfc/{submissionId}/haplotypes | 
[**hfcSubmissionIdLabelsGet**](DefaultApi.md#hfcSubmissionIdLabelsGet) | **GET** /hfc/{submissionId}/labels | 
[**hfcSubmissionIdPopulationGet**](DefaultApi.md#hfcSubmissionIdPopulationGet) | **GET** /hfc/{submissionId}/population | 
[**hfcSubmissionIdScopeGet**](DefaultApi.md#hfcSubmissionIdScopeGet) | **GET** /hfc/{submissionId}/scope | 


<a name="hfcGet"></a>
# **hfcGet**
> HFCurationListResponse hfcGet()



Gets a list of all submission data sets 

### Example
```java
// Import classes:
//import io.swagger.client.ApiException;
//import io.swagger.client.api.DefaultApi;


DefaultApi apiInstance = new DefaultApi();
try {
    HFCurationListResponse result = apiInstance.hfcGet();
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling DefaultApi#hfcGet");
    e.printStackTrace();
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**HFCurationListResponse**](HFCurationListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

<a name="hfcLabelGet"></a>
# **hfcLabelGet**
> LabelResponse hfcLabelGet()



Get a list of all labels

### Example
```java
// Import classes:
//import io.swagger.client.ApiException;
//import io.swagger.client.api.DefaultApi;


DefaultApi apiInstance = new DefaultApi();
try {
    LabelResponse result = apiInstance.hfcLabelGet();
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling DefaultApi#hfcLabelGet");
    e.printStackTrace();
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**LabelResponse**](LabelResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

<a name="hfcPopulationGet"></a>
# **hfcPopulationGet**
> PopulationResponse hfcPopulationGet()



Get a list of all populations 

### Example
```java
// Import classes:
//import io.swagger.client.ApiException;
//import io.swagger.client.api.DefaultApi;


DefaultApi apiInstance = new DefaultApi();
try {
    PopulationResponse result = apiInstance.hfcPopulationGet();
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling DefaultApi#hfcPopulationGet");
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
 - **Accept**: Not defined

<a name="hfcPopulationPopulationIdGet"></a>
# **hfcPopulationPopulationIdGet**
> PopulationSubmissionResponse hfcPopulationPopulationIdGet(populationId)



Returns a population with its attached submissions

### Example
```java
// Import classes:
//import io.swagger.client.ApiException;
//import io.swagger.client.api.DefaultApi;


DefaultApi apiInstance = new DefaultApi();
Long populationId = 789L; // Long | The population id
try {
    PopulationSubmissionResponse result = apiInstance.hfcPopulationPopulationIdGet(populationId);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling DefaultApi#hfcPopulationPopulationIdGet");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **populationId** | **Long**| The population id |

### Return type

[**PopulationSubmissionResponse**](PopulationSubmissionResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

<a name="hfcPost"></a>
# **hfcPost**
> HFCurationResponse hfcPost(hfCurationRequest)



Storing of a new Haplotype Frequency set. 

### Example
```java
// Import classes:
//import io.swagger.client.ApiException;
//import io.swagger.client.api.DefaultApi;


DefaultApi apiInstance = new DefaultApi();
HFCurationRequest hfCurationRequest = new HFCurationRequest(); // HFCurationRequest | Haplotype Frequency Curation Data
try {
    HFCurationResponse result = apiInstance.hfcPost(hfCurationRequest);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling DefaultApi#hfcPost");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **hfCurationRequest** | [**HFCurationRequest**](HFCurationRequest.md)| Haplotype Frequency Curation Data |

### Return type

[**HFCurationResponse**](HFCurationResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

<a name="hfcSubmissionIdCohortGet"></a>
# **hfcSubmissionIdCohortGet**
> CohortData hfcSubmissionIdCohortGet(submissionId)



Returns the list of haplotypes attached to the given submission

### Example
```java
// Import classes:
//import io.swagger.client.ApiException;
//import io.swagger.client.api.DefaultApi;


DefaultApi apiInstance = new DefaultApi();
Long submissionId = 789L; // Long | The submission id
try {
    CohortData result = apiInstance.hfcSubmissionIdCohortGet(submissionId);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling DefaultApi#hfcSubmissionIdCohortGet");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **submissionId** | **Long**| The submission id |

### Return type

[**CohortData**](CohortData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

<a name="hfcSubmissionIdDelete"></a>
# **hfcSubmissionIdDelete**
> hfcSubmissionIdDelete(submissionId)



Delete based on submissionId

### Example
```java
// Import classes:
//import io.swagger.client.ApiException;
//import io.swagger.client.api.DefaultApi;


DefaultApi apiInstance = new DefaultApi();
Long submissionId = 789L; // Long | 
try {
    apiInstance.hfcSubmissionIdDelete(submissionId);
} catch (ApiException e) {
    System.err.println("Exception when calling DefaultApi#hfcSubmissionIdDelete");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **submissionId** | **Long**|  |

### Return type

null (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

<a name="hfcSubmissionIdGet"></a>
# **hfcSubmissionIdGet**
> HFCurationResponse hfcSubmissionIdGet(submissionId)



Returns a submission of haplotypes

### Example
```java
// Import classes:
//import io.swagger.client.ApiException;
//import io.swagger.client.api.DefaultApi;


DefaultApi apiInstance = new DefaultApi();
Long submissionId = 789L; // Long | The submission id that the haplotype frequencies were submitted under
try {
    HFCurationResponse result = apiInstance.hfcSubmissionIdGet(submissionId);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling DefaultApi#hfcSubmissionIdGet");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **submissionId** | **Long**| The submission id that the haplotype frequencies were submitted under |

### Return type

[**HFCurationResponse**](HFCurationResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

<a name="hfcSubmissionIdHaplotypesGet"></a>
# **hfcSubmissionIdHaplotypesGet**
> HaplotypeFrequencyData hfcSubmissionIdHaplotypesGet(submissionId)



Returns the list of haplotypes attached to the given submission

### Example
```java
// Import classes:
//import io.swagger.client.ApiException;
//import io.swagger.client.api.DefaultApi;


DefaultApi apiInstance = new DefaultApi();
Long submissionId = 789L; // Long | The submission id
try {
    HaplotypeFrequencyData result = apiInstance.hfcSubmissionIdHaplotypesGet(submissionId);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling DefaultApi#hfcSubmissionIdHaplotypesGet");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **submissionId** | **Long**| The submission id |

### Return type

[**HaplotypeFrequencyData**](HaplotypeFrequencyData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

<a name="hfcSubmissionIdLabelsGet"></a>
# **hfcSubmissionIdLabelsGet**
> LabelData hfcSubmissionIdLabelsGet(submissionId)



Returns the labels associated to the submission

### Example
```java
// Import classes:
//import io.swagger.client.ApiException;
//import io.swagger.client.api.DefaultApi;


DefaultApi apiInstance = new DefaultApi();
Long submissionId = 789L; // Long | The submission id
try {
    LabelData result = apiInstance.hfcSubmissionIdLabelsGet(submissionId);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling DefaultApi#hfcSubmissionIdLabelsGet");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **submissionId** | **Long**| The submission id |

### Return type

[**LabelData**](LabelData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

<a name="hfcSubmissionIdPopulationGet"></a>
# **hfcSubmissionIdPopulationGet**
> PopulationData hfcSubmissionIdPopulationGet(submissionId)



Returns the population of the given submission

### Example
```java
// Import classes:
//import io.swagger.client.ApiException;
//import io.swagger.client.api.DefaultApi;


DefaultApi apiInstance = new DefaultApi();
Long submissionId = 789L; // Long | The submission id
try {
    PopulationData result = apiInstance.hfcSubmissionIdPopulationGet(submissionId);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling DefaultApi#hfcSubmissionIdPopulationGet");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **submissionId** | **Long**| The submission id |

### Return type

[**PopulationData**](PopulationData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

<a name="hfcSubmissionIdScopeGet"></a>
# **hfcSubmissionIdScopeGet**
> ScopeData hfcSubmissionIdScopeGet(submissionId)



Returns the scope of the genotypes used for creating the submitted haplotypes

### Example
```java
// Import classes:
//import io.swagger.client.ApiException;
//import io.swagger.client.api.DefaultApi;


DefaultApi apiInstance = new DefaultApi();
Long submissionId = 789L; // Long | The submission id
try {
    ScopeData result = apiInstance.hfcSubmissionIdScopeGet(submissionId);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling DefaultApi#hfcSubmissionIdScopeGet");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **submissionId** | **Long**| The submission id |

### Return type

[**ScopeData**](ScopeData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

