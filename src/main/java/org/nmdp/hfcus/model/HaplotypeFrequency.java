package org.nmdp.hfcus.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.nmdp.hfcus.model.exceptions.RequiredFieldInvalidException;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
public class HaplotypeFrequency implements ICurationDataModel<io.swagger.model.HaplotypeFrequency> {

    public HaplotypeFrequency(io.swagger.model.HaplotypeFrequency swaggerObject) {
        haplotypeString = swaggerObject.getHaplotypeString();
        if (haplotypeString == null){
            throw new RequiredFieldInvalidException("requires a haplotype string");
        }
        frequency = swaggerObject.getFrequency();
        if (frequency == null){
            throw new RequiredFieldInvalidException("requires a frequency");
        }
        if (swaggerObject.getFrequencyErrorList() != null){
            errorList = new ArrayList<>();
            for (io.swagger.model.FrequencyError error: swaggerObject.getFrequencyErrorList()) {
                errorList.add(new FrequencyError(error));
            }
        }
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String haplotypeString;
    private Double frequency;
    @OneToMany(cascade = CascadeType.ALL)
    private List<FrequencyError> errorList;

    @Override
    public io.swagger.model.HaplotypeFrequency toSwaggerObject(){
        io.swagger.model.HaplotypeFrequency data = new io.swagger.model.HaplotypeFrequency();
        data.setHaplotypeString(haplotypeString);
        data.setFrequency(frequency);
        if (errorList != null){
            List<io.swagger.model.FrequencyError> errors = new ArrayList<>();
            for (FrequencyError error: errorList) {
                errors.add(error.toSwaggerObject());
            }
            data.setFrequencyErrorList(errors);
        }
        return data;
    }
}
