package io.swagger.model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.io.Serializable;
import javax.validation.Valid;
import javax.validation.constraints.*;

/**
 * ScopeElement
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-11-03T12:15:20.805-05:00")

public class ScopeElement  implements Serializable {
  private static final long serialVersionUID = 1L;

  @JsonProperty("name")
  private String name = null;

  @JsonProperty("freeName")
  private String freeName = null;

  /**
   * type of label
   */
  public enum TypeOfScopeEnum {
    GENE("gene"),
    
    FEATURE("feature");

    private String value;

    TypeOfScopeEnum(String value) {
      this.value = value;
    }

    @Override
    @JsonValue
    public String toString() {
      return String.valueOf(value);
    }

    @JsonCreator
    public static TypeOfScopeEnum fromValue(String text) {
      for (TypeOfScopeEnum b : TypeOfScopeEnum.values()) {
        if (String.valueOf(b.value).equals(text)) {
          return b;
        }
      }
      return null;
    }
  }

  @JsonProperty("typeOfScope")
  private TypeOfScopeEnum typeOfScope = null;

  public ScopeElement name(String name) {
    this.name = name;
    return this;
  }

   /**
   * label name
   * @return name
  **/
  @ApiModelProperty(value = "label name")


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public ScopeElement freeName(String freeName) {
    this.freeName = freeName;
    return this;
  }

   /**
   * label name
   * @return freeName
  **/
  @ApiModelProperty(value = "label name")


  public String getFreeName() {
    return freeName;
  }

  public void setFreeName(String freeName) {
    this.freeName = freeName;
  }

  public ScopeElement typeOfScope(TypeOfScopeEnum typeOfScope) {
    this.typeOfScope = typeOfScope;
    return this;
  }

   /**
   * type of label
   * @return typeOfScope
  **/
  @ApiModelProperty(value = "type of label")


  public TypeOfScopeEnum getTypeOfScope() {
    return typeOfScope;
  }

  public void setTypeOfScope(TypeOfScopeEnum typeOfScope) {
    this.typeOfScope = typeOfScope;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    ScopeElement scopeElement = (ScopeElement) o;
    return Objects.equals(this.name, scopeElement.name) &&
        Objects.equals(this.freeName, scopeElement.freeName) &&
        Objects.equals(this.typeOfScope, scopeElement.typeOfScope);
  }

  @Override
  public int hashCode() {
    return Objects.hash(name, freeName, typeOfScope);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class ScopeElement {\n");
    
    sb.append("    name: ").append(toIndentedString(name)).append("\n");
    sb.append("    freeName: ").append(toIndentedString(freeName)).append("\n");
    sb.append("    typeOfScope: ").append(toIndentedString(typeOfScope)).append("\n");
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

