package io.swagger.model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.model.PopulationData;
import java.io.Serializable;
import javax.validation.Valid;
import javax.validation.constraints.*;

/**
 * PopulationResponse
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-11-09T13:39:49.392-06:00")

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

