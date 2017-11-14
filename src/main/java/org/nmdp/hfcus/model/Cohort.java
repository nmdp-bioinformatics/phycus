package org.nmdp.hfcus.model;


import io.swagger.model.CohortData;

import javax.persistence.*;

@Entity
public class Cohort {

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
        name = swaggerObject.getName();
    }

    public Long getId() {
        return id;
    }

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

    public CohortData toSwaggerObject(){
        CohortData data = new CohortData();
        data.setGenotypeList(genotypeList.toSwaggerObject());
        data.setName(name);
        return data;
    }
}
