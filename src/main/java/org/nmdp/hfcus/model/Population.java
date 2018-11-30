package org.nmdp.hfcus.model;

import io.swagger.model.PopulationData;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.nmdp.hfcus.model.exceptions.RequiredFieldInvalidException;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;

@Entity
@Data
@NoArgsConstructor
public class Population implements Serializable, ICurationDataModel<PopulationData> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String description;

    public Population(String name, String description) {
        this.name = name;
        if (this.name == null){
            throw new RequiredFieldInvalidException("requires name");
        }
        this.description = description;
    }

    @Override
    public PopulationData toSwaggerObject(){
        PopulationData data = new PopulationData();
        data.setId(id);
        data.setName(name);
        data.setDescription(description);
        return data;
    }
}
