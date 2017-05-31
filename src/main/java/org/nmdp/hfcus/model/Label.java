package org.nmdp.hfcus.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Label {
    public Label(){
        //intentionally left empty
    }

    public Label(io.swagger.model.Label swaggerObject){
        value = swaggerObject.getValue();
        typeOfLabel = swaggerObject.getTypeOfLabel();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String id;
    private String value;
    private String typeOfLabel;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getTypeOfLabel() {
        return typeOfLabel;
    }

    public void setTypeOfLabel(String typeOfLabel) {
        this.typeOfLabel = typeOfLabel;
    }

    public io.swagger.model.Label toSwaggerObject(){
        io.swagger.model.Label data = new io.swagger.model.Label();
        data.setValue(value);
        data.setTypeOfLabel(typeOfLabel);
        return data;
    }

}
