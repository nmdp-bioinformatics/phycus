package io.swagger.model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.model.PopulationSubmissionData;
import java.util.ArrayList;
import java.util.List;
import java.io.Serializable;
import javax.validation.Valid;
import javax.validation.constraints.*;

/**
 * PopulationSubmissionResponse
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-11-13T16:03:03.769+01:00")

public class PopulationSubmissionResponse  implements Serializable {
  private static final long serialVersionUID = 1L;

  @JsonProperty("PopulationSubmissionList")
  private List<PopulationSubmissionData> populationSubmissionList = null;

  public PopulationSubmissionResponse populationSubmissionList(List<PopulationSubmissionData> populationSubmissionList) {
    this.populationSubmissionList = populationSubmissionList;
    return this;
  }

  public PopulationSubmissionResponse addPopulationSubmissionListItem(PopulationSubmissionData populationSubmissionListItem) {
    if (this.populationSubmissionList == null) {
      this.populationSubmissionList = new ArrayList<PopulationSubmissionData>();
    }
    this.populationSubmissionList.add(populationSubmissionListItem);
    return this;
  }

   /**
   * List of populations together with all attached submissions
   * @return populationSubmissionList
  **/
  @ApiModelProperty(value = "List of populations together with all attached submissions")

  @Valid

  public List<PopulationSubmissionData> getPopulationSubmissionList() {
    return populationSubmissionList;
  }

  public void setPopulationSubmissionList(List<PopulationSubmissionData> populationSubmissionList) {
    this.populationSubmissionList = populationSubmissionList;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    PopulationSubmissionResponse populationSubmissionResponse = (PopulationSubmissionResponse) o;
    return Objects.equals(this.populationSubmissionList, populationSubmissionResponse.populationSubmissionList);
  }

  @Override
  public int hashCode() {
    return Objects.hash(populationSubmissionList);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class PopulationSubmissionResponse {\n");
    
    sb.append("    populationSubmissionList: ").append(toIndentedString(populationSubmissionList)).append("\n");
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

