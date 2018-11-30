package org.nmdp.hfcus.model;


import io.swagger.model.CohortData;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.nmdp.hfcus.model.exceptions.RequiredFieldInvalidException;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
public class Cohort implements ICurationDataModel<CohortData> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @OneToOne(cascade = CascadeType.ALL)
    private GenotypeList genotypeList;
    private String name;

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

    @Override
    public CohortData toSwaggerObject(){
        CohortData data = new CohortData();
        data.setGenotypeList(genotypeList.toSwaggerObject());
        data.setName(name);
        data.setId(id);
        return data;
    }
}
