package io.swagger.model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.model.GenotypeList;
import java.io.Serializable;
import javax.validation.Valid;
import javax.validation.constraints.*;

/**
 * CohortData
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-11-09T13:39:49.392-06:00")

public class CohortData  implements Serializable {
  private static final long serialVersionUID = 1L;

  @JsonProperty("GenotypeList")
  private GenotypeList genotypeList = null;

  public CohortData genotypeList(GenotypeList genotypeList) {
    this.genotypeList = genotypeList;
    return this;
  }

   /**
   * Get genotypeList
   * @return genotypeList
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull

  @Valid

  public GenotypeList getGenotypeList() {
    return genotypeList;
  }

  public void setGenotypeList(GenotypeList genotypeList) {
    this.genotypeList = genotypeList;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    CohortData cohortData = (CohortData) o;
    return Objects.equals(this.genotypeList, cohortData.genotypeList);
  }

  @Override
  public int hashCode() {
    return Objects.hash(genotypeList);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class CohortData {\n");
    
    sb.append("    genotypeList: ").append(toIndentedString(genotypeList)).append("\n");
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

