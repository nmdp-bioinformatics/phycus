package org.nmdp.hfcus.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.nmdp.hfcus.model.exceptions.RequiredFieldInvalidException;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
public class Quality implements ICurationDataModel<io.swagger.model.Quality> {

    public Quality(io.swagger.model.Quality swaggerObject){
        value = swaggerObject.getValue();
        if (value == null){
            throw new RequiredFieldInvalidException("requires value");
        }
        typeOfQuality = swaggerObject.getTypeOfQuality();
        if (typeOfQuality == null){
            throw new RequiredFieldInvalidException("requires typeOfQuality");
        }
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Double value;
    @Enumerated(EnumType.STRING)
    private io.swagger.model.Quality.TypeOfQualityEnum typeOfQuality;

    @Override
    public io.swagger.model.Quality toSwaggerObject(){
        io.swagger.model.Quality data = new io.swagger.model.Quality();
        data.setValue(value);
        data.setTypeOfQuality(typeOfQuality);
        return data;
    }
}
