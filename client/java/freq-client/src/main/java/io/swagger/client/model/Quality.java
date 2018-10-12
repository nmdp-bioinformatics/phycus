/*
 * Haplotype Frequency Curation Service
 * Allows to store and return haplotype frequency data
 *
 * OpenAPI spec version: 1.0.0
 * 
 *
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen.git
 * Do not edit the class manually.
 */


package io.swagger.client.model;

import java.util.Objects;
import com.google.gson.TypeAdapter;
import com.google.gson.annotations.JsonAdapter;
import com.google.gson.annotations.SerializedName;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.io.IOException;

/**
 * Quality
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaClientCodegen", date = "2018-10-12T09:58:25.177-07:00")
public class Quality {
  @SerializedName("value")
  private Double value = null;

  /**
   * type of quality
   */
  @JsonAdapter(TypeOfQualityEnum.Adapter.class)
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

    public String getValue() {
      return value;
    }

    @Override
    public String toString() {
      return String.valueOf(value);
    }

    public static TypeOfQualityEnum fromValue(String text) {
      for (TypeOfQualityEnum b : TypeOfQualityEnum.values()) {
        if (String.valueOf(b.value).equals(text)) {
          return b;
        }
      }
      return null;
    }

    public static class Adapter extends TypeAdapter<TypeOfQualityEnum> {
      @Override
      public void write(final JsonWriter jsonWriter, final TypeOfQualityEnum enumeration) throws IOException {
        jsonWriter.value(enumeration.getValue());
      }

      @Override
      public TypeOfQualityEnum read(final JsonReader jsonReader) throws IOException {
        String value = jsonReader.nextString();
        return TypeOfQualityEnum.fromValue(String.valueOf(value));
      }
    }
  }

  @SerializedName("typeOfQuality")
  private TypeOfQualityEnum typeOfQuality = null;

  public Quality value(Double value) {
    this.value = value;
    return this;
  }

   /**
   * value of quality
   * @return value
  **/
  @ApiModelProperty(required = true, value = "value of quality")
  public Double getValue() {
    return value;
  }

  public void setValue(Double value) {
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

