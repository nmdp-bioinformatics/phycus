package org.nmdp.hfcus.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Data
@NoArgsConstructor
public class FrequencyError implements ICurationDataModel<io.swagger.model.FrequencyError> {

    public FrequencyError(io.swagger.model.FrequencyError error) {
        value = error.getValue();
        typeOfError = error.getTypeOfError();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Double value;
    private String typeOfError;

    @Override
    public io.swagger.model.FrequencyError toSwaggerObject(){
        io.swagger.model.FrequencyError data = new io.swagger.model.FrequencyError();
        data.setValue(value);
        data.setTypeOfError(typeOfError);
        return data;
    }
}
