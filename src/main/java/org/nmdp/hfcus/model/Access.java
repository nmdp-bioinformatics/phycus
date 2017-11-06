package org.nmdp.hfcus.model;

import io.swagger.model.AccessData;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Access {
    public Access(){
        //intentionally left empty
    }

    public Access(AccessData swaggerObject) {
        typeOfAccess = swaggerObject.getTypeOfAccess();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String typeOfAccess;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTypeOfAccess() {
        return typeOfAccess;
    }

    public void setTypeOfAccess(String typeOfAccess) {
        this.typeOfAccess = typeOfAccess;
    }

    public AccessData toSwaggerObject(){
        AccessData data = new AccessData();
        data.setTypeOfAccess(typeOfAccess);
        return data;
    }
}
