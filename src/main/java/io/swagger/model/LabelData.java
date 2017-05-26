package io.swagger.model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.model.LabelList;
import java.io.Serializable;
import javax.validation.constraints.*;
/**
 * LabelData
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-05-26T11:57:21.787-05:00")

public class LabelData  implements Serializable {
  @JsonProperty("LabelList")
  private LabelList labelList = null;

  public LabelData labelList(LabelList labelList) {
    this.labelList = labelList;
    return this;
  }

   /**
   * Get labelList
   * @return labelList
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull
  public LabelList getLabelList() {
    return labelList;
  }

  public void setLabelList(LabelList labelList) {
    this.labelList = labelList;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    LabelData labelData = (LabelData) o;
    return Objects.equals(this.labelList, labelData.labelList);
  }

  @Override
  public int hashCode() {
    return Objects.hash(labelList);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class LabelData {\n");
    
    sb.append("    labelList: ").append(toIndentedString(labelList)).append("\n");
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

