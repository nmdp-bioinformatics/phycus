/*
 * Haplotype Frequency Curation Service
 * Allows to store and return haplotype frequency data
 *
 * OpenAPI spec version: 1.0.0
 * 
 *
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen.git
 * Do not edit the class manually.
 */


package io.swagger.client.model;

import java.util.Objects;
import com.google.gson.TypeAdapter;
import com.google.gson.annotations.JsonAdapter;
import com.google.gson.annotations.SerializedName;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.client.model.FrequencyError;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * HaplotypeFrequency
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaClientCodegen", date = "2018-11-01T08:14:07.511-07:00")
public class HaplotypeFrequency {
  @SerializedName("haplotypeString")
  private String haplotypeString = null;

  @SerializedName("frequency")
  private Double frequency = null;

  @SerializedName("FrequencyErrorList")
  private List<FrequencyError> frequencyErrorList = null;

  public HaplotypeFrequency haplotypeString(String haplotypeString) {
    this.haplotypeString = haplotypeString;
    return this;
  }

   /**
   * GL string describing the haplotype
   * @return haplotypeString
  **/
  @ApiModelProperty(required = true, value = "GL string describing the haplotype")
  public String getHaplotypeString() {
    return haplotypeString;
  }

  public void setHaplotypeString(String haplotypeString) {
    this.haplotypeString = haplotypeString;
  }

  public HaplotypeFrequency frequency(Double frequency) {
    this.frequency = frequency;
    return this;
  }

   /**
   * value of frequency
   * @return frequency
  **/
  @ApiModelProperty(required = true, value = "value of frequency")
  public Double getFrequency() {
    return frequency;
  }

  public void setFrequency(Double frequency) {
    this.frequency = frequency;
  }

  public HaplotypeFrequency frequencyErrorList(List<FrequencyError> frequencyErrorList) {
    this.frequencyErrorList = frequencyErrorList;
    return this;
  }

  public HaplotypeFrequency addFrequencyErrorListItem(FrequencyError frequencyErrorListItem) {
    if (this.frequencyErrorList == null) {
      this.frequencyErrorList = new ArrayList<FrequencyError>();
    }
    this.frequencyErrorList.add(frequencyErrorListItem);
    return this;
  }

   /**
   * List of frequency errors
   * @return frequencyErrorList
  **/
  @ApiModelProperty(value = "List of frequency errors")
  public List<FrequencyError> getFrequencyErrorList() {
    return frequencyErrorList;
  }

  public void setFrequencyErrorList(List<FrequencyError> frequencyErrorList) {
    this.frequencyErrorList = frequencyErrorList;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    HaplotypeFrequency haplotypeFrequency = (HaplotypeFrequency) o;
    return Objects.equals(this.haplotypeString, haplotypeFrequency.haplotypeString) &&
        Objects.equals(this.frequency, haplotypeFrequency.frequency) &&
        Objects.equals(this.frequencyErrorList, haplotypeFrequency.frequencyErrorList);
  }

  @Override
  public int hashCode() {
    return Objects.hash(haplotypeString, frequency, frequencyErrorList);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class HaplotypeFrequency {\n");
    
    sb.append("    haplotypeString: ").append(toIndentedString(haplotypeString)).append("\n");
    sb.append("    frequency: ").append(toIndentedString(frequency)).append("\n");
    sb.append("    frequencyErrorList: ").append(toIndentedString(frequencyErrorList)).append("\n");
    sb.append("}");
    return sb.toString();
  }

  /**
   * Convert the given object to string with each line indented by 4 spaces
   * (except the first line).
   */
  private String toIndentedString(java.lang.Object o) {
    if (o == null) {
      return "null";
    }
    return o.toString().replace("\n", "\n    ");
  }

}
