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
public class Label implements ICurationDataModel<io.swagger.model.Label> {

    public Label(io.swagger.model.Label swaggerObject){
        value = swaggerObject.getValue();
        typeOfLabel = swaggerObject.getTypeOfLabel();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String value;
    private String typeOfLabel;

    @Override
    public io.swagger.model.Label toSwaggerObject(){
        io.swagger.model.Label data = new io.swagger.model.Label();
        data.setValue(value);
        data.setTypeOfLabel(typeOfLabel);
        return data;
    }

}
