package io.swagger.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModelProperty;

import javax.validation.Valid;
import java.io.Serializable;
import java.util.Objects;

/**
 * PopulationResponse
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-11-09T13:04:42.031-06:00")

public class PopulationResponse  implements Serializable {
  private static final long serialVersionUID = 1L;

  @JsonProperty("population")
  private PopulationData population = null;

  public PopulationResponse population(PopulationData population) {
    this.population = population;
    return this;
  }

   /**
   * Saved Population
   * @return population
  **/
  @ApiModelProperty(value = "Saved Population")

  @Valid

  public PopulationData getPopulation() {
    return population;
  }

  public void setPopulation(PopulationData population) {
    this.population = population;
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
    return Objects.equals(this.population, populationResponse.population);
  }

  @Override
  public int hashCode() {
    return Objects.hash(population);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class PopulationResponse {\n");
    
    sb.append("    population: ").append(toIndentedString(population)).append("\n");
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

