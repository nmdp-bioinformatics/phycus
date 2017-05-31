package io.swagger.model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.util.ArrayList;
import java.util.List;
import javax.validation.constraints.*;
/**
 * PopulationResponse
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-05-30T13:04:33.940Z")

public class PopulationResponse   {
  @JsonProperty("PopulationList")
  private List<PopulationData> populationList = new ArrayList<PopulationData>();

  public PopulationResponse populationList(List<PopulationData> populationList) {
    this.populationList = populationList;
    return this;
  }

  public PopulationResponse addPopulationListItem(PopulationData populationListItem) {
    this.populationList.add(populationListItem);
    return this;
  }

   /**
   * List of populations
   * @return populationList
  **/
  @ApiModelProperty(value = "List of populations")
  public List<PopulationData> getPopulationList() {
    return populationList;
  }

  public void setPopulationList(List<PopulationData> populationList) {
    this.populationList = populationList;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    PopulationResponse populationResponse = (PopulationResponse) o;
    return Objects.equals(this.populationList, populationResponse.populationList);
  }

  @Override
  public int hashCode() {
    return Objects.hash(populationList);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class PopulationResponse {\n");
    
    sb.append("    populationList: ").append(toIndentedString(populationList)).append("\n");
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

