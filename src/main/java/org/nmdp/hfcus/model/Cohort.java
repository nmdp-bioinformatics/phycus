package org.nmdp.hfcus.model;


import io.swagger.model.CohortData;
import org.nmdp.hfcus.model.exceptions.RequiredFieldInvalidException;

import javax.persistence.*;

@Entity
public class Cohort implements ICurationDataModel<CohortData> {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @OneToOne(cascade = CascadeType.ALL)
    private GenotypeList genotypeList;
    private String name;

    public Cohort(){
        //intentionally left empty
    }

    public Cohort(CohortData swaggerObject){
        if (swaggerObject.getGenotypeList() != null) {
            genotypeList = new GenotypeList(swaggerObject.getGenotypeList());
        }
        else
        {
            throw new RequiredFieldInvalidException("Requires list of genotypes");
        }
        name = swaggerObject.getName();
        if (name == null){
            throw new RequiredFieldInvalidException("Requires name for the cohort");
        }
    }

    public Long getId() { return id; }

    public void setId(Long id) {
        this.id = id;
    }

    public GenotypeList getGenotypeList() {
        return genotypeList;
    }

    public void setGenotypeList(GenotypeList genotypeList) {
        this.genotypeList = genotypeList;
    }
    
    public String getName() {
    	return name;
    }
    
    public void setName(String name) {
    	this.name = name;
    }

    @Override
    public CohortData toSwaggerObject(){
        CohortData data = new CohortData();
        data.setGenotypeList(genotypeList.toSwaggerObject());
        data.setName(name);
        data.setId(id);
        return data;
    }
}
