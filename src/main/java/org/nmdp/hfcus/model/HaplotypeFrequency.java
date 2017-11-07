package org.nmdp.hfcus.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.ArrayList;
import java.util.List;

@Entity
public class HaplotypeFrequency {
    public HaplotypeFrequency(){
        //intentionally left empty
    }
    public HaplotypeFrequency(io.swagger.model.HaplotypeFrequency swaggerObject) {
        haplotypeString = swaggerObject.getHaplotypeString();
        frequency = swaggerObject.getFrequency();
        if (swaggerObject.getFrequencyErrorList() != null){
            errorList = new ArrayList<>();
            for (io.swagger.model.FrequencyError error: swaggerObject.getFrequencyErrorList()) {
                errorList.add(new FrequencyError(error));
            }
        }
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String haplotypeString;
    private Double frequency;
    @OneToMany(cascade = CascadeType.ALL)
    private List<FrequencyError> errorList;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getHaplotypeString() {
        return haplotypeString;
    }

    public void setHaplotypeString(String haplotypeString) {
        this.haplotypeString = haplotypeString;
    }

    public Double getFrequency() {
        return frequency;
    }

    public void setFrequency(Double frequency) {
        this.frequency = frequency;
    }

    public List<FrequencyError> getErrorList() {
        return errorList;
    }

    public void setErrorList(List<FrequencyError> errorList) {
        this.errorList = errorList;
    }

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
