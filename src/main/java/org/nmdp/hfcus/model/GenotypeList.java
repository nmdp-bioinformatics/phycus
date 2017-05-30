package org.nmdp.hfcus.model;

import io.swagger.model.License;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class GenotypeList {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String id;
    private License.TypeOfLicenseEnum license;
    @OneToMany(cascade = CascadeType.ALL)
    private List<Genotype> genotypeList;

    public GenotypeList(){
        //intentionallyLeftEmpty
    }

    public GenotypeList(io.swagger.model.GenotypeList swaggerObject){
        if (swaggerObject.getLicense() != null) {
            license = swaggerObject.getLicense().getTypeOfLicense();
        }
        genotypeList = new ArrayList<>();
        if (swaggerObject.getGenotype() != null) {
            for (io.swagger.model.Genotype genotype : swaggerObject.getGenotype()) {
                genotypeList.add(new Genotype(genotype));
            }
        }
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public License.TypeOfLicenseEnum getLicense() {
        return license;
    }

    public void setLicense(License.TypeOfLicenseEnum license) {
        this.license = license;
    }

    public List<Genotype> getGenotypeList() {
        return genotypeList;
    }

    public void setGenotypeList(List<Genotype> genotypeList) {
        this.genotypeList = genotypeList;
    }

    public io.swagger.model.GenotypeList toSwaggerObject(){
        io.swagger.model.GenotypeList data = new io.swagger.model.GenotypeList();
        if (license != null) {
            License lic = new License();
            lic.setTypeOfLicense(license);
            data.setLicense(lic);
        }
        List<io.swagger.model.Genotype> swaggerGenotypeList = new ArrayList<>();
        for (Genotype genotype: genotypeList) {
            swaggerGenotypeList.add(genotype.toSwaggerObject());
        }
        data.setGenotype(swaggerGenotypeList);
        return data;
    }
}
