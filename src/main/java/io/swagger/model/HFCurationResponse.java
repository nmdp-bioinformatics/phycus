package io.swagger.model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.io.Serializable;
import javax.validation.constraints.*;
/**
 * HFCurationResponse
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-05-26T11:57:21.787-05:00")

public class HFCurationResponse  implements Serializable {
  @JsonProperty("SubmissionID")
  private String submissionID = null;

  @JsonProperty("PopulationID")
  private String populationID = null;

  @JsonProperty("CohortID")
  private String cohortID = null;

  @JsonProperty("MethodSetID")
  private String methodSetID = null;

  @JsonProperty("LabelID")
  private String labelID = null;

  @JsonProperty("HaplotypeListID")
  private String haplotypeListID = null;

  @JsonProperty("ScopeID")
  private String scopeID = null;

  @JsonProperty("AccessID")
  private String accessID = null;

  public HFCurationResponse submissionID(String submissionID) {
    this.submissionID = submissionID;
    return this;
  }

   /**
   * Reference to a submission
   * @return submissionID
  **/
  @ApiModelProperty(required = true, value = "Reference to a submission")
  @NotNull
  public String getSubmissionID() {
    return submissionID;
  }

  public void setSubmissionID(String submissionID) {
    this.submissionID = submissionID;
  }

  public HFCurationResponse populationID(String populationID) {
    this.populationID = populationID;
    return this;
  }

   /**
   * Reference to a population
   * @return populationID
  **/
  @ApiModelProperty(value = "Reference to a population")
  public String getPopulationID() {
    return populationID;
  }

  public void setPopulationID(String populationID) {
    this.populationID = populationID;
  }

  public HFCurationResponse cohortID(String cohortID) {
    this.cohortID = cohortID;
    return this;
  }

   /**
   * References a cohort
   * @return cohortID
  **/
  @ApiModelProperty(value = "References a cohort")
  public String getCohortID() {
    return cohortID;
  }

  public void setCohortID(String cohortID) {
    this.cohortID = cohortID;
  }

  public HFCurationResponse methodSetID(String methodSetID) {
    this.methodSetID = methodSetID;
    return this;
  }

   /**
   * References a method set
   * @return methodSetID
  **/
  @ApiModelProperty(value = "References a method set")
  public String getMethodSetID() {
    return methodSetID;
  }

  public void setMethodSetID(String methodSetID) {
    this.methodSetID = methodSetID;
  }

  public HFCurationResponse labelID(String labelID) {
    this.labelID = labelID;
    return this;
  }

   /**
   * References a label
   * @return labelID
  **/
  @ApiModelProperty(value = "References a label")
  public String getLabelID() {
    return labelID;
  }

  public void setLabelID(String labelID) {
    this.labelID = labelID;
  }

  public HFCurationResponse haplotypeListID(String haplotypeListID) {
    this.haplotypeListID = haplotypeListID;
    return this;
  }

   /**
   * References a haplotype list
   * @return haplotypeListID
  **/
  @ApiModelProperty(value = "References a haplotype list")
  public String getHaplotypeListID() {
    return haplotypeListID;
  }

  public void setHaplotypeListID(String haplotypeListID) {
    this.haplotypeListID = haplotypeListID;
  }

  public HFCurationResponse scopeID(String scopeID) {
    this.scopeID = scopeID;
    return this;
  }

   /**
   * References a scope
   * @return scopeID
  **/
  @ApiModelProperty(value = "References a scope")
  public String getScopeID() {
    return scopeID;
  }

  public void setScopeID(String scopeID) {
    this.scopeID = scopeID;
  }

  public HFCurationResponse accessID(String accessID) {
    this.accessID = accessID;
    return this;
  }

   /**
   * References a access controls
   * @return accessID
  **/
  @ApiModelProperty(value = "References a access controls")
  public String getAccessID() {
    return accessID;
  }

  public void setAccessID(String accessID) {
    this.accessID = accessID;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    HFCurationResponse hfCurationResponse = (HFCurationResponse) o;
    return Objects.equals(this.submissionID, hfCurationResponse.submissionID) &&
        Objects.equals(this.populationID, hfCurationResponse.populationID) &&
        Objects.equals(this.cohortID, hfCurationResponse.cohortID) &&
        Objects.equals(this.methodSetID, hfCurationResponse.methodSetID) &&
        Objects.equals(this.labelID, hfCurationResponse.labelID) &&
        Objects.equals(this.haplotypeListID, hfCurationResponse.haplotypeListID) &&
        Objects.equals(this.scopeID, hfCurationResponse.scopeID) &&
        Objects.equals(this.accessID, hfCurationResponse.accessID);
  }

  @Override
  public int hashCode() {
    return Objects.hash(submissionID, populationID, cohortID, methodSetID, labelID, haplotypeListID, scopeID, accessID);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class HFCurationResponse {\n");
    
    sb.append("    submissionID: ").append(toIndentedString(submissionID)).append("\n");
    sb.append("    populationID: ").append(toIndentedString(populationID)).append("\n");
    sb.append("    cohortID: ").append(toIndentedString(cohortID)).append("\n");
    sb.append("    methodSetID: ").append(toIndentedString(methodSetID)).append("\n");
    sb.append("    labelID: ").append(toIndentedString(labelID)).append("\n");
    sb.append("    haplotypeListID: ").append(toIndentedString(haplotypeListID)).append("\n");
    sb.append("    scopeID: ").append(toIndentedString(scopeID)).append("\n");
    sb.append("    accessID: ").append(toIndentedString(accessID)).append("\n");
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

