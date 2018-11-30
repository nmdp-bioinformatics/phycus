package org.nmdp.hfcus.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.nmdp.hfcus.model.exceptions.RequiredFieldInvalidException;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
public class Genotype implements ICurationDataModel<io.swagger.model.Genotype> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long genotypeId;
    private String genotypeString;
    @OneToMany(cascade = CascadeType.ALL)
    private List<GenotypeMethod> genotypingMethods;

    public Genotype(io.swagger.model.Genotype swaggerObject){
        genotypeString = swaggerObject.getGenotypeString();
        if (genotypeString == null){
            throw new RequiredFieldInvalidException("Requires a genotype string");
        }
        if (swaggerObject.getGenotypingMethods() != null){
            genotypingMethods = new ArrayList<>();
            for (io.swagger.model.GenotypeMethod method :swaggerObject.getGenotypingMethods()) {
                genotypingMethods.add(new GenotypeMethod(method));
            }
        }
    }

    @Override
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
