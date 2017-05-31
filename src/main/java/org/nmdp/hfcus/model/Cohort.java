package org.nmdp.hfcus.model;


import io.swagger.model.CohortData;

import javax.persistence.*;

@Entity
public class Cohort {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String id;
    @OneToOne(cascade = CascadeType.ALL)
    private GenotypeList genotypeList;

    public Cohort(){
        //intentionally left empty
    }

    public Cohort(CohortData swaggerObject){
        if (swaggerObject.getGenotypeList() != null) {
            genotypeList = new GenotypeList(swaggerObject.getGenotypeList());
        }
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public GenotypeList getGenotypeList() {
        return genotypeList;
    }

    public void setGenotypeList(GenotypeList genotypeList) {
        this.genotypeList = genotypeList;
    }

    public CohortData toSwaggerObject(){
        CohortData data = new CohortData();
        data.setGenotypeList(genotypeList.toSwaggerObject());
        return data;
    }
}
