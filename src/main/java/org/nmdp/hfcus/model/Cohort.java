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

    public Cohort(){
        //intentionally left empty
    }

    public Cohort(CohortData swaggerObject){
        if (swaggerObject.getGenotypeList() != null) {
            genotypeList = new GenotypeList(swaggerObject.getGenotypeList());
        }
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

    public CohortData toSwaggerObject(){
        CohortData data = new CohortData();
        data.setGenotypeList(genotypeList.toSwaggerObject());
        return data;
    }
}
