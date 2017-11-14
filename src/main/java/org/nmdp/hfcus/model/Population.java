package org.nmdp.hfcus.model;

import io.swagger.model.PopulationData;
import org.nmdp.hfcus.model.exceptions.RequiredFieldInvalidException;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;

@Entity
public class Population implements Serializable {

    public Population(){
        //intentionally left empty
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;

    private String description;

    public Population(String name, String description) {
        this.name = name;
        if (this.name == null){
            throw new RequiredFieldInvalidException("requires name");
        }
        this.description = description;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public PopulationData toSwaggerObject(){
        PopulationData data = new PopulationData();
        data.setId(id);
        data.setName(name);
        data.setDescription(description);
        return data;
    }
}
