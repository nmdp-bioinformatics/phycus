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
 * AccessData
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-11-09T14:35:44.303-06:00")

public class AccessData  implements Serializable {
  private static final long serialVersionUID = 1L;

  @JsonProperty("typeOfAccess")
  private String typeOfAccess = null;

  public AccessData typeOfAccess(String typeOfAccess) {
    this.typeOfAccess = typeOfAccess;
    return this;
  }

   /**
   * There will be a default license if one is not provided
   * @return typeOfAccess
  **/
  @ApiModelProperty(required = true, value = "There will be a default license if one is not provided")
  @NotNull


  public String getTypeOfAccess() {
    return typeOfAccess;
  }

  public void setTypeOfAccess(String typeOfAccess) {
    this.typeOfAccess = typeOfAccess;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    AccessData accessData = (AccessData) o;
    return Objects.equals(this.typeOfAccess, accessData.typeOfAccess);
  }

  @Override
  public int hashCode() {
    return Objects.hash(typeOfAccess);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class AccessData {\n");
    
    sb.append("    typeOfAccess: ").append(toIndentedString(typeOfAccess)).append("\n");
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

