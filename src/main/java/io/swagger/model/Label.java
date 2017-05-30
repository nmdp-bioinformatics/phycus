package io.swagger.model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import javax.validation.constraints.*;
/**
 * List of Genotypes
 */
@ApiModel(description = "List of Genotypes")
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-05-30T13:04:33.940Z")

public class Label   {
  @JsonProperty("value")
  private String value = null;

  @JsonProperty("typeOfLabel")
  private String typeOfLabel = null;

  public Label value(String value) {
    this.value = value;
    return this;
  }

   /**
   * label name
   * @return value
  **/
  @ApiModelProperty(value = "label name")
  public String getValue() {
    return value;
  }

  public void setValue(String value) {
    this.value = value;
  }

  public Label typeOfLabel(String typeOfLabel) {
    this.typeOfLabel = typeOfLabel;
    return this;
  }

   /**
   * type of label
   * @return typeOfLabel
  **/
  @ApiModelProperty(value = "type of label")
  public String getTypeOfLabel() {
    return typeOfLabel;
  }

  public void setTypeOfLabel(String typeOfLabel) {
    this.typeOfLabel = typeOfLabel;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Label label = (Label) o;
    return Objects.equals(this.value, label.value) &&
        Objects.equals(this.typeOfLabel, label.typeOfLabel);
  }

  @Override
  public int hashCode() {
    return Objects.hash(value, typeOfLabel);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class Label {\n");
    
    sb.append("    value: ").append(toIndentedString(value)).append("\n");
    sb.append("    typeOfLabel: ").append(toIndentedString(typeOfLabel)).append("\n");
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

