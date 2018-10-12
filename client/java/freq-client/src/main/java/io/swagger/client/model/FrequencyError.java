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
import java.io.IOException;

/**
 * FrequencyError
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaClientCodegen", date = "2018-10-12T09:58:25.177-07:00")
public class FrequencyError {
  @SerializedName("value")
  private Double value = null;

  @SerializedName("typeOfError")
  private String typeOfError = null;

  public FrequencyError value(Double value) {
    this.value = value;
    return this;
  }

   /**
   * value of error
   * @return value
  **/
  @ApiModelProperty(value = "value of error")
  public Double getValue() {
    return value;
  }

  public void setValue(Double value) {
    this.value = value;
  }

  public FrequencyError typeOfError(String typeOfError) {
    this.typeOfError = typeOfError;
    return this;
  }

   /**
   * type of error
   * @return typeOfError
  **/
  @ApiModelProperty(value = "type of error")
  public String getTypeOfError() {
    return typeOfError;
  }

  public void setTypeOfError(String typeOfError) {
    this.typeOfError = typeOfError;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    FrequencyError frequencyError = (FrequencyError) o;
    return Objects.equals(this.value, frequencyError.value) &&
        Objects.equals(this.typeOfError, frequencyError.typeOfError);
  }

  @Override
  public int hashCode() {
    return Objects.hash(value, typeOfError);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class FrequencyError {\n");
    
    sb.append("    value: ").append(toIndentedString(value)).append("\n");
    sb.append("    typeOfError: ").append(toIndentedString(typeOfError)).append("\n");
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

