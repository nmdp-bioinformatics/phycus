package io.swagger.model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.model.HaplotypeFrequency;
import io.swagger.model.License;
import io.swagger.model.Quality;
import io.swagger.model.ResolutionData;
import java.util.ArrayList;
import java.util.List;
import java.io.Serializable;
import javax.validation.Valid;
import javax.validation.constraints.*;

/**
 * HaplotypeFrequencyData
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-11-13T16:03:03.769+01:00")

public class HaplotypeFrequencyData  implements Serializable {
  private static final long serialVersionUID = 1L;

  @JsonProperty("License")
  private License license = null;

  @JsonProperty("ResolutionData")
  private ResolutionData resolutionData = null;

  @JsonProperty("HaplotypeFrequencyList")
  private List<HaplotypeFrequency> haplotypeFrequencyList = new ArrayList<HaplotypeFrequency>();

  @JsonProperty("QualityList")
  private List<Quality> qualityList = null;

  public HaplotypeFrequencyData license(License license) {
    this.license = license;
    return this;
  }

   /**
   * Get license
   * @return license
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull

  @Valid

  public License getLicense() {
    return license;
  }

  public void setLicense(License license) {
    this.license = license;
  }

  public HaplotypeFrequencyData resolutionData(ResolutionData resolutionData) {
    this.resolutionData = resolutionData;
    return this;
  }

   /**
   * Get resolutionData
   * @return resolutionData
  **/
  @ApiModelProperty(value = "")

  @Valid

  public ResolutionData getResolutionData() {
    return resolutionData;
  }

  public void setResolutionData(ResolutionData resolutionData) {
    this.resolutionData = resolutionData;
  }

  public HaplotypeFrequencyData haplotypeFrequencyList(List<HaplotypeFrequency> haplotypeFrequencyList) {
    this.haplotypeFrequencyList = haplotypeFrequencyList;
    return this;
  }

  public HaplotypeFrequencyData addHaplotypeFrequencyListItem(HaplotypeFrequency haplotypeFrequencyListItem) {
    this.haplotypeFrequencyList.add(haplotypeFrequencyListItem);
    return this;
  }

   /**
   * List of HaplotypeFrequencys
   * @return haplotypeFrequencyList
  **/
  @ApiModelProperty(required = true, value = "List of HaplotypeFrequencys")
  @NotNull

  @Valid

  public List<HaplotypeFrequency> getHaplotypeFrequencyList() {
    return haplotypeFrequencyList;
  }

  public void setHaplotypeFrequencyList(List<HaplotypeFrequency> haplotypeFrequencyList) {
    this.haplotypeFrequencyList = haplotypeFrequencyList;
  }

  public HaplotypeFrequencyData qualityList(List<Quality> qualityList) {
    this.qualityList = qualityList;
    return this;
  }

  public HaplotypeFrequencyData addQualityListItem(Quality qualityListItem) {
    if (this.qualityList == null) {
      this.qualityList = new ArrayList<Quality>();
    }
    this.qualityList.add(qualityListItem);
    return this;
  }

   /**
   * List of Quality
   * @return qualityList
  **/
  @ApiModelProperty(value = "List of Quality")

  @Valid

  public List<Quality> getQualityList() {
    return qualityList;
  }

  public void setQualityList(List<Quality> qualityList) {
    this.qualityList = qualityList;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    HaplotypeFrequencyData haplotypeFrequencyData = (HaplotypeFrequencyData) o;
    return Objects.equals(this.license, haplotypeFrequencyData.license) &&
        Objects.equals(this.resolutionData, haplotypeFrequencyData.resolutionData) &&
        Objects.equals(this.haplotypeFrequencyList, haplotypeFrequencyData.haplotypeFrequencyList) &&
        Objects.equals(this.qualityList, haplotypeFrequencyData.qualityList);
  }

  @Override
  public int hashCode() {
    return Objects.hash(license, resolutionData, haplotypeFrequencyList, qualityList);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class HaplotypeFrequencyData {\n");
    
    sb.append("    license: ").append(toIndentedString(license)).append("\n");
    sb.append("    resolutionData: ").append(toIndentedString(resolutionData)).append("\n");
    sb.append("    haplotypeFrequencyList: ").append(toIndentedString(haplotypeFrequencyList)).append("\n");
    sb.append("    qualityList: ").append(toIndentedString(qualityList)).append("\n");
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

