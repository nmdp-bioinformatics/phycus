package io.swagger.model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import javax.validation.constraints.*;
/**
 * Method Record
 */
@ApiModel(description = "Method Record")
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-05-30T13:04:33.940Z")

public class Method   {
  /**
   * Type of method label
   */
  public enum TypeOfMethodEnum {
    EM_ALGORITHM("EM_ALGORITHM"),
    
    EM_VERSION("EM_VERSION"),
    
    EM_ALG_REF("EM_ALG_REF"),
    
    MAC_SERVICE("MAC_SERVICE"),
    
    MAC_SER_REF("MAC_SER_REF"),
    
    MAC_VERSION("MAC_VERSION"),
    
    ARS_SERVICE("ARS_SERVICE"),
    
    ARS_SERV_REF("ARS_SERV_REF"),
    
    ARS_VERSION("ARS_VERSION"),
    
    HWE_METHOD("HWE_METHOD"),
    
    HWE_REF("HWE_REF"),
    
    LD_METHOD("LD_METHOD"),
    
    LD_METHOD_REF("LD_METHOD_REF");

    private String value;

    TypeOfMethodEnum(String value) {
      this.value = value;
    }

    @Override
    @JsonValue
    public String toString() {
      return String.valueOf(value);
    }

    @JsonCreator
    public static TypeOfMethodEnum fromValue(String text) {
      for (TypeOfMethodEnum b : TypeOfMethodEnum.values()) {
        if (String.valueOf(b.value).equals(text)) {
          return b;
        }
      }
      return null;
    }
  }

  @JsonProperty("typeOfMethod")
  private TypeOfMethodEnum typeOfMethod = null;

  @JsonProperty("methodValue")
  private String methodValue = null;

  @JsonProperty("methodComment")
  private String methodComment = null;

  @JsonProperty("methodReference")
  private String methodReference = null;

  public Method typeOfMethod(TypeOfMethodEnum typeOfMethod) {
    this.typeOfMethod = typeOfMethod;
    return this;
  }

   /**
   * Type of method label
   * @return typeOfMethod
  **/
  @ApiModelProperty(value = "Type of method label")
  public TypeOfMethodEnum getTypeOfMethod() {
    return typeOfMethod;
  }

  public void setTypeOfMethod(TypeOfMethodEnum typeOfMethod) {
    this.typeOfMethod = typeOfMethod;
  }

  public Method methodValue(String methodValue) {
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

  public Method methodComment(String methodComment) {
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

  public Method methodReference(String methodReference) {
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
    Method method = (Method) o;
    return Objects.equals(this.typeOfMethod, method.typeOfMethod) &&
        Objects.equals(this.methodValue, method.methodValue) &&
        Objects.equals(this.methodComment, method.methodComment) &&
        Objects.equals(this.methodReference, method.methodReference);
  }

  @Override
  public int hashCode() {
    return Objects.hash(typeOfMethod, methodValue, methodComment, methodReference);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class Method {\n");
    
    sb.append("    typeOfMethod: ").append(toIndentedString(typeOfMethod)).append("\n");
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

