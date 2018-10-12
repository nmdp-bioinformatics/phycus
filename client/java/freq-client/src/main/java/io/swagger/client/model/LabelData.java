/*
 * Haplotype Frequency Curation Service
 * Allows to store and return haplotype frequency data
 *
 * OpenAPI spec version: 1.0.0
 * 
 *
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen.git
 * Do not edit the class manually.
 */


package io.swagger.client.model;

import java.util.Objects;
import com.google.gson.TypeAdapter;
import com.google.gson.annotations.JsonAdapter;
import com.google.gson.annotations.SerializedName;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.client.model.LabelList;
import java.io.IOException;

/**
 * LabelData
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaClientCodegen", date = "2018-10-12T09:58:25.177-07:00")
public class LabelData {
  @SerializedName("LabelList")
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

