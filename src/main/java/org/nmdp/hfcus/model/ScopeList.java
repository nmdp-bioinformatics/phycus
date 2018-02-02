package org.nmdp.hfcus.model;

import io.swagger.model.ScopeData;
import io.swagger.model.ScopeElement;
import org.nmdp.hfcus.model.exceptions.RequiredFieldInvalidException;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class ScopeList implements ICurationDataModel<ScopeData> {
    public ScopeList(){
        //intentionally left empty
    }
    public ScopeList(ScopeData swaggerObject) {
        if (swaggerObject.getScopeElement() != null){
            scopeList = new ArrayList<>();
            for (ScopeElement scope: swaggerObject.getScopeElement()) {
                scopeList.add(new Scope(scope));
            }
            if (scopeList.size() == 0){
                throw new RequiredFieldInvalidException("scopeList must not be empty");
            }
        }
        else
        {
            throw new RequiredFieldInvalidException("requires scopeList");
        }
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @OneToMany(cascade = CascadeType.ALL)
    private List<Scope> scopeList;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<Scope> getScopeList() {
        return scopeList;
    }

    public void setScopeList(List<Scope> scopeList) {
        this.scopeList = scopeList;
    }

    @Override
    public ScopeData toSwaggerObject(){
        ScopeData data = new ScopeData();
        if (scopeList != null){
            List<ScopeElement> scopes = new ArrayList<>();
            for (Scope scope: scopeList) {
                scopes.add(scope.toSwaggerObject());
            }
            data.setScopeElement(scopes);
        }
        return data;
    }
}
