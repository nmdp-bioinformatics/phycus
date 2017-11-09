package io.swagger.model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.model.HFCurationResponse;
import java.util.ArrayList;
import java.util.List;
import java.io.Serializable;
import javax.validation.Valid;
import javax.validation.constraints.*;

/**
 * HFCurationListResponse
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-11-09T15:23:31.951-06:00")

public class HFCurationListResponse  implements Serializable {
  private static final long serialVersionUID = 1L;

  @JsonProperty("HFCurationResponses")
  private List<HFCurationResponse> hfCurationResponses = null;

  public HFCurationListResponse hfCurationResponses(List<HFCurationResponse> hfCurationResponses) {
    this.hfCurationResponses = hfCurationResponses;
    return this;
  }

  public HFCurationListResponse addHfCurationResponsesItem(HFCurationResponse hfCurationResponsesItem) {
    if (this.hfCurationResponses == null) {
      this.hfCurationResponses = new ArrayList<HFCurationResponse>();
    }
    this.hfCurationResponses.add(hfCurationResponsesItem);
    return this;
  }

   /**
   * Get hfCurationResponses
   * @return hfCurationResponses
  **/
  @ApiModelProperty(value = "")

  @Valid

  public List<HFCurationResponse> getHfCurationResponses() {
    return hfCurationResponses;
  }

  public void setHfCurationResponses(List<HFCurationResponse> hfCurationResponses) {
    this.hfCurationResponses = hfCurationResponses;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    HFCurationListResponse hfCurationListResponse = (HFCurationListResponse) o;
    return Objects.equals(this.hfCurationResponses, hfCurationListResponse.hfCurationResponses);
  }

  @Override
  public int hashCode() {
    return Objects.hash(hfCurationResponses);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class HFCurationListResponse {\n");
    
    sb.append("    hfCurationResponses: ").append(toIndentedString(hfCurationResponses)).append("\n");
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

