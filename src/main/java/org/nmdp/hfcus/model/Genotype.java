package org.nmdp.hfcus.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Genotype {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long genotypeId;
    private String genotypeString;
    @OneToMany(cascade = CascadeType.ALL)
    private List<GenotypeMethod> genotypingMethods;

    public Genotype(){
        //intentionally left empty
    }

    public Genotype(io.swagger.model.Genotype swaggerObject){
        genotypeString = swaggerObject.getGenotypeString();
        if (swaggerObject.getGenotypingMethods() != null){
            genotypingMethods = new ArrayList<>();
            for (io.swagger.model.GenotypeMethod method :swaggerObject.getGenotypingMethods()) {
                genotypingMethods.add(new GenotypeMethod(method));
            }
        }
    }

    public Long getGenotypeId() {
        return genotypeId;
    }

    public void setGenotypeId(Long genotypeId) {
        this.genotypeId = genotypeId;
    }

    public String getGenotypeString() {
        return genotypeString;
    }

    public void setGenotypeString(String genotypeString) {
        this.genotypeString = genotypeString;
    }

    public List<GenotypeMethod> getGenotypingMethods() {
        return genotypingMethods;
    }

    public void setGenotypingMethods(List<GenotypeMethod> genotypingMethods) {
        this.genotypingMethods = genotypingMethods;
    }

    public io.swagger.model.Genotype toSwaggerObject(){
        io.swagger.model.Genotype data = new io.swagger.model.Genotype();
        data.setGenotypeString(genotypeString);
        if (genotypingMethods != null){
            List<io.swagger.model.GenotypeMethod> methods = new ArrayList<>();
            for (GenotypeMethod method: genotypingMethods) {
                methods.add(method.toSwaggerObject());
            }
            data.setGenotypingMethods(methods);
        }
        return data;
    }
}
