package io.swagger.model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import javax.validation.constraints.*;
/**
 * License models, there will be a default license if one is not provided
 */
@ApiModel(description = "License models, there will be a default license if one is not provided")
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-05-30T13:04:33.940Z")

public class License   {
  /**
   * Type of creative commons license
   */
  public enum TypeOfLicenseEnum {
    CC0("CC0"),
    
    BY("by"),
    
    BY_SA("by-sa"),
    
    BY_ND("by-nd"),
    
    BY_NC("by-nc"),
    
    BY_NC_SA("by-nc-sa"),
    
    BY_NC_ND("by-nc-nd");

    private String value;

    TypeOfLicenseEnum(String value) {
      this.value = value;
    }

    @Override
    @JsonValue
    public String toString() {
      return String.valueOf(value);
    }

    @JsonCreator
    public static TypeOfLicenseEnum fromValue(String text) {
      for (TypeOfLicenseEnum b : TypeOfLicenseEnum.values()) {
        if (String.valueOf(b.value).equals(text)) {
          return b;
        }
      }
      return null;
    }
  }

  @JsonProperty("typeOfLicense")
  private TypeOfLicenseEnum typeOfLicense = null;

  public License typeOfLicense(TypeOfLicenseEnum typeOfLicense) {
    this.typeOfLicense = typeOfLicense;
    return this;
  }

   /**
   * Type of creative commons license
   * @return typeOfLicense
  **/
  @ApiModelProperty(required = true, value = "Type of creative commons license")
  @NotNull
  public TypeOfLicenseEnum getTypeOfLicense() {
    return typeOfLicense;
  }

  public void setTypeOfLicense(TypeOfLicenseEnum typeOfLicense) {
    this.typeOfLicense = typeOfLicense;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    License license = (License) o;
    return Objects.equals(this.typeOfLicense, license.typeOfLicense);
  }

  @Override
  public int hashCode() {
    return Objects.hash(typeOfLicense);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class License {\n");
    
    sb.append("    typeOfLicense: ").append(toIndentedString(typeOfLicense)).append("\n");
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

