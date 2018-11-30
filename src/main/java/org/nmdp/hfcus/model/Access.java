package org.nmdp.hfcus.model;

import io.swagger.model.AccessData;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.nmdp.hfcus.model.exceptions.RequiredFieldInvalidException;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Data
@NoArgsConstructor
public class Access implements ICurationDataModel<AccessData> {

    Access(AccessData swaggerObject) {
        typeOfAccess = swaggerObject.getTypeOfAccess();
        if (typeOfAccess == null){
            throw new RequiredFieldInvalidException("Requires type of access");
        }
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String typeOfAccess;

    @Override
    public  AccessData toSwaggerObject(){
        AccessData data = new AccessData();
        data.setTypeOfAccess(typeOfAccess);
        return data;
    }
}
