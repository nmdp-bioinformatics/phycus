package org.nmdp.hfcus.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class FrequencyError implements ICurationDataModel<io.swagger.model.FrequencyError> {
    public FrequencyError(){
        //intentionally left empty
    }

    public FrequencyError(io.swagger.model.FrequencyError error) {
        value = error.getValue();
        typeOfError = error.getTypeOfError();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private Double value;
    private String typeOfError;

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

    public String getTypeOfError() {
        return typeOfError;
    }

    public void setTypeOfError(String typeOfError) {
        this.typeOfError = typeOfError;
    }

    @Override
    public io.swagger.model.FrequencyError toSwaggerObject(){
        io.swagger.model.FrequencyError data = new io.swagger.model.FrequencyError();
        data.setValue(value);
        data.setTypeOfError(typeOfError);
        return data;
    }
}
