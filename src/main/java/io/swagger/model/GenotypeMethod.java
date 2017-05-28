package io.swagger.model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.io.Serializable;
import javax.validation.constraints.*;
/**
 * GenotypeMethod Record
 */
@ApiModel(description = "GenotypeMethod Record")
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-05-26T11:57:21.787-05:00")

public class GenotypeMethod  implements Serializable {
  /**
   * Type of method label
   */
  public enum MethodLabelEnum {
    TYPING_METHOD("TYPING_METHOD"),
    
    TYPING_REF("TYPING_REF"),
    
    TYPING_DATE("TYPING_DATE"),
    
    TYPING_IMGT_VER("TYPING_IMGT_VER"),
    
    MIRING_REF("MIRING_REF");

    private String value;

    MethodLabelEnum(String value) {
      this.value = value;
    }

    @Override
    @JsonValue
    public String toString() {
      return String.valueOf(value);
    }

    @JsonCreator
    public static MethodLabelEnum fromValue(String text) {
      for (MethodLabelEnum b : MethodLabelEnum.values()) {
        if (String.valueOf(b.value).equals(text)) {
          return b;
        }
      }
      return null;
    }
  }

  @JsonProperty("methodLabel")
  private MethodLabelEnum methodLabel = null;

  @JsonProperty("methodValue")
  private String methodValue = null;

  @JsonProperty("methodComment")
  private String methodComment = null;

  @JsonProperty("methodReference")
  private String methodReference = null;

  public GenotypeMethod methodLabel(MethodLabelEnum methodLabel) {
    this.methodLabel = methodLabel;
    return this;
  }

   /**
   * Type of method label
   * @return methodLabel
  **/
  @ApiModelProperty(value = "Type of method label")
  public MethodLabelEnum getMethodLabel() {
    return methodLabel;
  }

  public void setMethodLabel(MethodLabelEnum methodLabel) {
    this.methodLabel = methodLabel;
  }

  public GenotypeMethod methodValue(String methodValue) {
    this.methodValue = methodValue;
    return this;
  }

   /**
   * Value of method
   * @return methodValue
  **/
  @ApiModelProperty(value = "Value of method")
  public String getMethodValue() {
    return methodValue;
  }

  public void setMethodValue(String methodValue) {
    this.methodValue = methodValue;
  }

  public GenotypeMethod methodComment(String methodComment) {
    this.methodComment = methodComment;
    return this;
  }

   /**
   * Comment on method
   * @return methodComment
  **/
  @ApiModelProperty(value = "Comment on method")
  public String getMethodComment() {
    return methodComment;
  }

  public void setMethodComment(String methodComment) {
    this.methodComment = methodComment;
  }

  public GenotypeMethod methodReference(String methodReference) {
    this.methodReference = methodReference;
    return this;
  }

   /**
   * To be used to refer to an external source
   * @return methodReference
  **/
  @ApiModelProperty(value = "To be used to refer to an external source")
  public String getMethodReference() {
    return methodReference;
  }

  public void setMethodReference(String methodReference) {
    this.methodReference = methodReference;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    GenotypeMethod genotypeMethod = (GenotypeMethod) o;
    return Objects.equals(this.methodLabel, genotypeMethod.methodLabel) &&
        Objects.equals(this.methodValue, genotypeMethod.methodValue) &&
        Objects.equals(this.methodComment, genotypeMethod.methodComment) &&
        Objects.equals(this.methodReference, genotypeMethod.methodReference);
  }

  @Override
  public int hashCode() {
    return Objects.hash(methodLabel, methodValue, methodComment, methodReference);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class GenotypeMethod {\n");
    
    sb.append("    methodLabel: ").append(toIndentedString(methodLabel)).append("\n");
    sb.append("    methodValue: ").append(toIndentedString(methodValue)).append("\n");
    sb.append("    methodComment: ").append(toIndentedString(methodComment)).append("\n");
    sb.append("    methodReference: ").append(toIndentedString(methodReference)).append("\n");
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

