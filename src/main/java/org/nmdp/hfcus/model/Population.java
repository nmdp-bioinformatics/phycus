package org.nmdp.hfcus.model;

import io.swagger.model.PopulationData;

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

    public Population(PopulationData swaggerObject){
        if (swaggerObject.getId() != null){
            id = swaggerObject.getId();
        }
        name = swaggerObject.getName();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String id;

    private String name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public PopulationData toSwaggerObject(){
        PopulationData data = new PopulationData();
        data.setId(id);
        data.setName(name);
        return data;
    }
}
