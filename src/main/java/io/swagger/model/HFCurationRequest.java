package io.swagger.model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.model.AccessData;
import io.swagger.model.CohortData;
import io.swagger.model.HaplotypeFrequencyData;
import io.swagger.model.LabelData;
import io.swagger.model.MethodData;
import io.swagger.model.ScopeData;
import java.io.Serializable;
import javax.validation.Valid;
import javax.validation.constraints.*;

/**
 * HFCurationRequest
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-11-09T15:23:31.951-06:00")

public class HFCurationRequest  implements Serializable {
  private static final long serialVersionUID = 1L;

  @JsonProperty("PopulationID")
  private Long populationID = null;

  @JsonProperty("CohortID")
  private Long cohortID = null;

  @JsonProperty("CohortData")
  private CohortData cohortData = null;

  @JsonProperty("MethodSetID")
  private Long methodSetID = null;

  @JsonProperty("MethodData")
  private MethodData methodData = null;

  @JsonProperty("LabelID")
  private Long labelID = null;

  @JsonProperty("LabelData")
  private LabelData labelData = null;

  @JsonProperty("HaplotypeFrequencyDataID")
  private String haplotypeFrequencyDataID = null;

  @JsonProperty("HaplotypeFrequencyData")
  private HaplotypeFrequencyData haplotypeFrequencyData = null;

  @JsonProperty("ScopeID")
  private Long scopeID = null;

  @JsonProperty("ScopeData")
  private ScopeData scopeData = null;

  @JsonProperty("AccessID")
  private Long accessID = null;

  @JsonProperty("AccessData")
  private AccessData accessData = null;

  public HFCurationRequest populationID(Long populationID) {
    this.populationID = populationID;
    return this;
  }

   /**
   * Reference to a population
   * @return populationID
  **/
  @ApiModelProperty(required = true, value = "Reference to a population")
  @NotNull


  public Long getPopulationID() {
    return populationID;
  }

  public void setPopulationID(Long populationID) {
    this.populationID = populationID;
  }

  public HFCurationRequest cohortID(Long cohortID) {
    this.cohortID = cohortID;
    return this;
  }

   /**
   * Cohort ID or genotype list
   * @return cohortID
  **/
  @ApiModelProperty(value = "Cohort ID or genotype list")


  public Long getCohortID() {
    return cohortID;
  }

  public void setCohortID(Long cohortID) {
    this.cohortID = cohortID;
  }

  public HFCurationRequest cohortData(CohortData cohortData) {
    this.cohortData = cohortData;
    return this;
  }

   /**
   * Get cohortData
   * @return cohortData
  **/
  @ApiModelProperty(value = "")

  @Valid

  public CohortData getCohortData() {
    return cohortData;
  }

  public void setCohortData(CohortData cohortData) {
    this.cohortData = cohortData;
  }

  public HFCurationRequest methodSetID(Long methodSetID) {
    this.methodSetID = methodSetID;
    return this;
  }

   /**
   * References a method set
   * @return methodSetID
  **/
  @ApiModelProperty(value = "References a method set")


  public Long getMethodSetID() {
    return methodSetID;
  }

  public void setMethodSetID(Long methodSetID) {
    this.methodSetID = methodSetID;
  }

  public HFCurationRequest methodData(MethodData methodData) {
    this.methodData = methodData;
    return this;
  }

   /**
   * Get methodData
   * @return methodData
  **/
  @ApiModelProperty(value = "")

  @Valid

  public MethodData getMethodData() {
    return methodData;
  }

  public void setMethodData(MethodData methodData) {
    this.methodData = methodData;
  }

  public HFCurationRequest labelID(Long labelID) {
    this.labelID = labelID;
    return this;
  }

   /**
   * References a label
   * @return labelID
  **/
  @ApiModelProperty(value = "References a label")


  public Long getLabelID() {
    return labelID;
  }

  public void setLabelID(Long labelID) {
    this.labelID = labelID;
  }

  public HFCurationRequest labelData(LabelData labelData) {
    this.labelData = labelData;
    return this;
  }

   /**
   * Get labelData
   * @return labelData
  **/
  @ApiModelProperty(value = "")

  @Valid

  public LabelData getLabelData() {
    return labelData;
  }

  public void setLabelData(LabelData labelData) {
    this.labelData = labelData;
  }

  public HFCurationRequest haplotypeFrequencyDataID(String haplotypeFrequencyDataID) {
    this.haplotypeFrequencyDataID = haplotypeFrequencyDataID;
    return this;
  }

   /**
   * References a haplotype list
   * @return haplotypeFrequencyDataID
  **/
  @ApiModelProperty(value = "References a haplotype list")


  public String getHaplotypeFrequencyDataID() {
    return haplotypeFrequencyDataID;
  }

  public void setHaplotypeFrequencyDataID(String haplotypeFrequencyDataID) {
    this.haplotypeFrequencyDataID = haplotypeFrequencyDataID;
  }

  public HFCurationRequest haplotypeFrequencyData(HaplotypeFrequencyData haplotypeFrequencyData) {
    this.haplotypeFrequencyData = haplotypeFrequencyData;
    return this;
  }

   /**
   * Get haplotypeFrequencyData
   * @return haplotypeFrequencyData
  **/
  @ApiModelProperty(value = "")

  @Valid

  public HaplotypeFrequencyData getHaplotypeFrequencyData() {
    return haplotypeFrequencyData;
  }

  public void setHaplotypeFrequencyData(HaplotypeFrequencyData haplotypeFrequencyData) {
    this.haplotypeFrequencyData = haplotypeFrequencyData;
  }

  public HFCurationRequest scopeID(Long scopeID) {
    this.scopeID = scopeID;
    return this;
  }

   /**
   * References a scope
   * @return scopeID
  **/
  @ApiModelProperty(value = "References a scope")


  public Long getScopeID() {
    return scopeID;
  }

  public void setScopeID(Long scopeID) {
    this.scopeID = scopeID;
  }

  public HFCurationRequest scopeData(ScopeData scopeData) {
    this.scopeData = scopeData;
    return this;
  }

   /**
   * Get scopeData
   * @return scopeData
  **/
  @ApiModelProperty(value = "")

  @Valid

  public ScopeData getScopeData() {
    return scopeData;
  }

  public void setScopeData(ScopeData scopeData) {
    this.scopeData = scopeData;
  }

  public HFCurationRequest accessID(Long accessID) {
    this.accessID = accessID;
    return this;
  }

   /**
   * References a access controls
   * @return accessID
  **/
  @ApiModelProperty(value = "References a access controls")


  public Long getAccessID() {
    return accessID;
  }

  public void setAccessID(Long accessID) {
    this.accessID = accessID;
  }

  public HFCurationRequest accessData(AccessData accessData) {
    this.accessData = accessData;
    return this;
  }

   /**
   * Get accessData
   * @return accessData
  **/
  @ApiModelProperty(value = "")

  @Valid

  public AccessData getAccessData() {
    return accessData;
  }

  public void setAccessData(AccessData accessData) {
    this.accessData = accessData;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    HFCurationRequest hfCurationRequest = (HFCurationRequest) o;
    return Objects.equals(this.populationID, hfCurationRequest.populationID) &&
        Objects.equals(this.cohortID, hfCurationRequest.cohortID) &&
        Objects.equals(this.cohortData, hfCurationRequest.cohortData) &&
        Objects.equals(this.methodSetID, hfCurationRequest.methodSetID) &&
        Objects.equals(this.methodData, hfCurationRequest.methodData) &&
        Objects.equals(this.labelID, hfCurationRequest.labelID) &&
        Objects.equals(this.labelData, hfCurationRequest.labelData) &&
        Objects.equals(this.haplotypeFrequencyDataID, hfCurationRequest.haplotypeFrequencyDataID) &&
        Objects.equals(this.haplotypeFrequencyData, hfCurationRequest.haplotypeFrequencyData) &&
        Objects.equals(this.scopeID, hfCurationRequest.scopeID) &&
        Objects.equals(this.scopeData, hfCurationRequest.scopeData) &&
        Objects.equals(this.accessID, hfCurationRequest.accessID) &&
        Objects.equals(this.accessData, hfCurationRequest.accessData);
  }

  @Override
  public int hashCode() {
    return Objects.hash(populationID, cohortID, cohortData, methodSetID, methodData, labelID, labelData, haplotypeFrequencyDataID, haplotypeFrequencyData, scopeID, scopeData, accessID, accessData);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class HFCurationRequest {\n");
    
    sb.append("    populationID: ").append(toIndentedString(populationID)).append("\n");
    sb.append("    cohortID: ").append(toIndentedString(cohortID)).append("\n");
    sb.append("    cohortData: ").append(toIndentedString(cohortData)).append("\n");
    sb.append("    methodSetID: ").append(toIndentedString(methodSetID)).append("\n");
    sb.append("    methodData: ").append(toIndentedString(methodData)).append("\n");
    sb.append("    labelID: ").append(toIndentedString(labelID)).append("\n");
    sb.append("    labelData: ").append(toIndentedString(labelData)).append("\n");
    sb.append("    haplotypeFrequencyDataID: ").append(toIndentedString(haplotypeFrequencyDataID)).append("\n");
    sb.append("    haplotypeFrequencyData: ").append(toIndentedString(haplotypeFrequencyData)).append("\n");
    sb.append("    scopeID: ").append(toIndentedString(scopeID)).append("\n");
    sb.append("    scopeData: ").append(toIndentedString(scopeData)).append("\n");
    sb.append("    accessID: ").append(toIndentedString(accessID)).append("\n");
    sb.append("    accessData: ").append(toIndentedString(accessData)).append("\n");
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

