package io.swagger.model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.math.BigDecimal;
import java.io.Serializable;
import javax.validation.constraints.*;
/**
 * Quality
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-05-26T11:57:21.787-05:00")

public class Quality  implements Serializable {
  @JsonProperty("value")
  private BigDecimal value = null;

  /**
   * type of quality
   */
  public enum TypeOfQualityEnum {
    DIV_LAMBDA("DIV_LAMBDA"),
    
    DIV_50("DIV_50"),
    
    DIV_50_REL("DIV_50_REL"),
    
    SAM_SIZE("SAM_SIZE"),
    
    SAM_POP("SAM_POP"),
    
    DIV_PGD("DIV_PGD"),
    
    DIV_HEAVY_TAIL("DIV_HEAVY_TAIL"),
    
    RES_TRS_COUNT("RES_TRS_COUNT"),
    
    RES_TRS("RES_TRS"),
    
    RES_SHARE_AMBIG("RES_SHARE_AMBIG"),
    
    RES_MISS_LOCI("RES_MISS_LOCI"),
    
    DEV_HWE("DEV_HWE"),
    
    ERR_STD("ERR_STD"),
    
    ERR_SAMP_80_100("ERR_SAMP_80_100"),
    
    SUM_FREQ_GAP("SUM_FREQ_GAP"),
    
    ERR_OFFSET("ERR_OFFSET"),
    
    LD_MEASURE("LD_MEASURE"),
    
    KFOLD_IMPUTE("KFOLD_IMPUTE"),
    
    KFOLD_PRED_ACTUAL("KFOLD_PRED_ACTUAL"),
    
    KFOLD_N("KFOLD_N");

    private String value;

    TypeOfQualityEnum(String value) {
      this.value = value;
    }

    @Override
    @JsonValue
    public String toString() {
      return String.valueOf(value);
    }

    @JsonCreator
    public static TypeOfQualityEnum fromValue(String text) {
      for (TypeOfQualityEnum b : TypeOfQualityEnum.values()) {
        if (String.valueOf(b.value).equals(text)) {
          return b;
        }
      }
      return null;
    }
  }

  @JsonProperty("typeOfQuality")
  private TypeOfQualityEnum typeOfQuality = null;

  public Quality value(BigDecimal value) {
    this.value = value;
    return this;
  }

   /**
   * label name
   * @return value
  **/
  @ApiModelProperty(required = true, value = "label name")
  @NotNull
  public BigDecimal getValue() {
    return value;
  }

  public void setValue(BigDecimal value) {
    this.value = value;
  }

  public Quality typeOfQuality(TypeOfQualityEnum typeOfQuality) {
    this.typeOfQuality = typeOfQuality;
    return this;
  }

   /**
   * type of quality
   * @return typeOfQuality
  **/
  @ApiModelProperty(required = true, value = "type of quality")
  @NotNull
  public TypeOfQualityEnum getTypeOfQuality() {
    return typeOfQuality;
  }

  public void setTypeOfQuality(TypeOfQualityEnum typeOfQuality) {
    this.typeOfQuality = typeOfQuality;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Quality quality = (Quality) o;
    return Objects.equals(this.value, quality.value) &&
        Objects.equals(this.typeOfQuality, quality.typeOfQuality);
  }

  @Override
  public int hashCode() {
    return Objects.hash(value, typeOfQuality);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class Quality {\n");
    
    sb.append("    value: ").append(toIndentedString(value)).append("\n");
    sb.append("    typeOfQuality: ").append(toIndentedString(typeOfQuality)).append("\n");
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

