package org.nmdp.hfcus.model;

import io.swagger.model.License;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
public class GenotypeList implements ICurationDataModel<io.swagger.model.GenotypeList> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Enumerated(EnumType.STRING)
    private License.TypeOfLicenseEnum license;
    @OneToMany(cascade = CascadeType.ALL)
    private List<Genotype> genotypeList;

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

    @Override
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
