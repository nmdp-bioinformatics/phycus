package org.nmdp.hfcus.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Quality {
    public Quality(){
        //intentionally left empty
    }

    public Quality(io.swagger.model.Quality swaggerObject){
        value = swaggerObject.getValue();
        typeOfQuality = swaggerObject.getTypeOfQuality();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private Double value;
    private io.swagger.model.Quality.TypeOfQualityEnum typeOfQuality;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }

    public io.swagger.model.Quality.TypeOfQualityEnum getTypeOfQuality() {
        return typeOfQuality;
    }

    public void setTypeOfQuality(io.swagger.model.Quality.TypeOfQualityEnum typeOfQuality) {
        this.typeOfQuality = typeOfQuality;
    }

    public io.swagger.model.Quality toSwaggerObject(){
        io.swagger.model.Quality data = new io.swagger.model.Quality();
        data.setValue(value);
        data.setTypeOfQuality(typeOfQuality);
        return data;
    }
}
