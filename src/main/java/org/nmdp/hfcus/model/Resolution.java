package org.nmdp.hfcus.model;

import io.swagger.model.ResolutionInfo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Resolution implements ICurationDataModel<ResolutionInfo> {
    public Resolution(){
        //intentionally left empty
    }

    public Resolution(ResolutionInfo swaggerObject) {
        scopeElement = swaggerObject.getScopeElement();
        resolution = swaggerObject.getResolution();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String scopeElement;
    private io.swagger.model.ResolutionInfo.ResolutionEnum resolution;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getScopeElement() {
        return scopeElement;
    }

    public void setScopeElement(String scopeElement) {
        this.scopeElement = scopeElement;
    }

    public ResolutionInfo.ResolutionEnum getResolution() {
        return resolution;
    }

    public void setResolution(ResolutionInfo.ResolutionEnum resolution) {
        this.resolution = resolution;
    }

    @Override
    public ResolutionInfo toSwaggerObject(){
        ResolutionInfo data = new ResolutionInfo();
        data.setScopeElement(scopeElement);
        data.setResolution(resolution);
        return data;
    }
}
