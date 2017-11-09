package io.swagger.model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.model.MethodList;
import java.io.Serializable;
import javax.validation.Valid;
import javax.validation.constraints.*;

/**
 * MethodData
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-11-09T13:04:42.031-06:00")

public class MethodData  implements Serializable {
  private static final long serialVersionUID = 1L;

  @JsonProperty("MethodList")
  private MethodList methodList = null;

  public MethodData methodList(MethodList methodList) {
    this.methodList = methodList;
    return this;
  }

   /**
   * Get methodList
   * @return methodList
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull

  @Valid

  public MethodList getMethodList() {
    return methodList;
  }

  public void setMethodList(MethodList methodList) {
    this.methodList = methodList;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    MethodData methodData = (MethodData) o;
    return Objects.equals(this.methodList, methodData.methodList);
  }

  @Override
  public int hashCode() {
    return Objects.hash(methodList);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class MethodData {\n");
    
    sb.append("    methodList: ").append(toIndentedString(methodList)).append("\n");
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

