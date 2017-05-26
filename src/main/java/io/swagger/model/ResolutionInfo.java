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
 * ResolutionInfo
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-05-26T11:57:21.787-05:00")

public class ResolutionInfo  implements Serializable {
  @JsonProperty("scopeElement")
  private String scopeElement = null;

  /**
   * resolution of the data
   */
  public enum ResolutionEnum {
    G("G"),
    
    P("P"),
    
    GNMDP("gNMDP"),
    
    GDKMS("gDKMS"),
    
    _2_FIELD("2-Field"),
    
    _4_FIELD("4-Field"),
    
    _6_FIELD("6-Field"),
    
    _8_FIELD("8-Field"),
    
    SEROLOGY("Serology");

    private String value;

    ResolutionEnum(String value) {
      this.value = value;
    }

    @Override
    @JsonValue
    public String toString() {
      return String.valueOf(value);
    }

    @JsonCreator
    public static ResolutionEnum fromValue(String text) {
      for (ResolutionEnum b : ResolutionEnum.values()) {
        if (String.valueOf(b.value).equals(text)) {
          return b;
        }
      }
      return null;
    }
  }

  @JsonProperty("resolution")
  private ResolutionEnum resolution = null;

  public ResolutionInfo scopeElement(String scopeElement) {
    this.scopeElement = scopeElement;
    return this;
  }

   /**
   * Get scopeElement
   * @return scopeElement
  **/
  @ApiModelProperty(value = "")
  public String getScopeElement() {
    return scopeElement;
  }

  public void setScopeElement(String scopeElement) {
    this.scopeElement = scopeElement;
  }

  public ResolutionInfo resolution(ResolutionEnum resolution) {
    this.resolution = resolution;
    return this;
  }

   /**
   * resolution of the data
   * @return resolution
  **/
  @ApiModelProperty(value = "resolution of the data")
  public ResolutionEnum getResolution() {
    return resolution;
  }

  public void setResolution(ResolutionEnum resolution) {
    this.resolution = resolution;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    ResolutionInfo resolutionInfo = (ResolutionInfo) o;
    return Objects.equals(this.scopeElement, resolutionInfo.scopeElement) &&
        Objects.equals(this.resolution, resolutionInfo.resolution);
  }

  @Override
  public int hashCode() {
    return Objects.hash(scopeElement, resolution);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class ResolutionInfo {\n");
    
    sb.append("    scopeElement: ").append(toIndentedString(scopeElement)).append("\n");
    sb.append("    resolution: ").append(toIndentedString(resolution)).append("\n");
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

