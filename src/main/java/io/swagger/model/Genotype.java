package io.swagger.model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.model.GenotypeMethod;
import java.util.ArrayList;
import java.util.List;
import javax.validation.constraints.*;
/**
 * Genotype
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-05-30T13:04:33.940Z")

public class Genotype   {
  @JsonProperty("genotypeString")
  private String genotypeString = null;

  @JsonProperty("genotypingMethods")
  private List<GenotypeMethod> genotypingMethods = new ArrayList<GenotypeMethod>();

  public Genotype genotypeString(String genotypeString) {
    this.genotypeString = genotypeString;
    return this;
  }

   /**
   * GL string of the genotype
   * @return genotypeString
  **/
  @ApiModelProperty(required = true, value = "GL string of the genotype")
  @NotNull
  public String getGenotypeString() {
    return genotypeString;
  }

  public void setGenotypeString(String genotypeString) {
    this.genotypeString = genotypeString;
  }

  public Genotype genotypingMethods(List<GenotypeMethod> genotypingMethods) {
    this.genotypingMethods = genotypingMethods;
    return this;
  }

  public Genotype addGenotypingMethodsItem(GenotypeMethod genotypingMethodsItem) {
    this.genotypingMethods.add(genotypingMethodsItem);
    return this;
  }

   /**
   * Additional Information on genotype
   * @return genotypingMethods
  **/
  @ApiModelProperty(value = "Additional Information on genotype")
  public List<GenotypeMethod> getGenotypingMethods() {
    return genotypingMethods;
  }

  public void setGenotypingMethods(List<GenotypeMethod> genotypingMethods) {
    this.genotypingMethods = genotypingMethods;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Genotype genotype = (Genotype) o;
    return Objects.equals(this.genotypeString, genotype.genotypeString) &&
        Objects.equals(this.genotypingMethods, genotype.genotypingMethods);
  }

  @Override
  public int hashCode() {
    return Objects.hash(genotypeString, genotypingMethods);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class Genotype {\n");
    
    sb.append("    genotypeString: ").append(toIndentedString(genotypeString)).append("\n");
    sb.append("    genotypingMethods: ").append(toIndentedString(genotypingMethods)).append("\n");
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

