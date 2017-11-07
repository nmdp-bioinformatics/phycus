package io.swagger.model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.io.Serializable;
import javax.validation.Valid;
import javax.validation.constraints.*;

/**
 * FrequencyError
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-11-03T12:15:20.805-05:00")

public class FrequencyError  implements Serializable {
  private static final long serialVersionUID = 1L;

  @JsonProperty("value")
  private Double value = null;

  @JsonProperty("typeOfError")
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

