package org.nmdp.hfcus.model;

import io.swagger.model.ScopeElement;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Scope {
    public Scope(){
        //intentionally left empty
    }
    public Scope(ScopeElement swaggerObject) {
        name = swaggerObject.getName();
        freeName = swaggerObject.getFreeName();
        typeOfScope = swaggerObject.getTypeOfScope();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String scopeId;
    private String name;
    private String freeName;
    private ScopeElement.TypeOfScopeEnum typeOfScope;

    public String getScopeId() {
        return scopeId;
    }

    public void setScopeId(String scopeId) {
        this.scopeId = scopeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFreeName() {
        return freeName;
    }

    public void setFreeName(String freeName) {
        this.freeName = freeName;
    }

    public ScopeElement.TypeOfScopeEnum getTypeOfScope() {
        return typeOfScope;
    }

    public void setTypeOfScope(ScopeElement.TypeOfScopeEnum typeOfScope) {
        this.typeOfScope = typeOfScope;
    }

    public ScopeElement toSwaggerObject(){
        ScopeElement data = new ScopeElement();
        data.setName(name);
        data.setFreeName(freeName);
        data.setTypeOfScope(typeOfScope);
        return data;
    }
}
