package org.nmdp.hfcus.model;

import io.swagger.model.AccessData;
import io.swagger.model.CohortData;
import io.swagger.model.HaplotypeFrequencyData;
import io.swagger.model.LabelData;
import io.swagger.model.MethodData;
import io.swagger.model.PopulationData;
import io.swagger.model.ScopeData;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;

@Document(collection = "HFCuration")
public class HFCuration implements Serializable {

    @Id
    private String id;

    private String populationID;

    private PopulationData populationData;

    private String cohortID;

    private CohortData cohortData;

    private String methodSetID;

    private MethodData methodData;

    private String labelID;

    private LabelData labelData;

    private String haplotypeFrequencyDataID;

    private HaplotypeFrequencyData haplotypeFrequencyData;

    private String scopeID;

    private ScopeData scopeData;

    private String accessID;

    private AccessData accessData;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPopulationID() {
        return populationID;
    }

    public void setPopulationID(String populationID) {
        this.populationID = populationID;
    }

    public PopulationData getPopulationData() {
        return populationData;
    }

    public void setPopulationData(PopulationData populationData) {
        this.populationData = populationData;
    }

    public String getCohortID() {
        return cohortID;
    }

    public void setCohortID(String cohortID) {
        this.cohortID = cohortID;
    }

    public CohortData getCohortData() {
        return cohortData;
    }

    public void setCohortData(CohortData cohortData) {
        this.cohortData = cohortData;
    }

    public String getMethodSetID() {
        return methodSetID;
    }

    public void setMethodSetID(String methodSetID) {
        this.methodSetID = methodSetID;
    }

    public MethodData getMethodData() {
        return methodData;
    }

    public void setMethodData(MethodData methodData) {
        this.methodData = methodData;
    }

    public String getLabelID() {
        return labelID;
    }

    public void setLabelID(String labelID) {
        this.labelID = labelID;
    }

    public LabelData getLabelData() {
        return labelData;
    }

    public void setLabelData(LabelData labelData) {
        this.labelData = labelData;
    }

    public String getHaplotypeFrequencyDataID() {
        return haplotypeFrequencyDataID;
    }

    public void setHaplotypeFrequencyDataID(String haplotypeFrequencyDataID) {
        this.haplotypeFrequencyDataID = haplotypeFrequencyDataID;
    }

    public HaplotypeFrequencyData getHaplotypeFrequencyData() {
        return haplotypeFrequencyData;
    }

    public void setHaplotypeFrequencyData(HaplotypeFrequencyData haplotypeFrequencyData) {
        this.haplotypeFrequencyData = haplotypeFrequencyData;
    }

    public String getScopeID() {
        return scopeID;
    }

    public void setScopeID(String scopeID) {
        this.scopeID = scopeID;
    }

    public ScopeData getScopeData() {
        return scopeData;
    }

    public void setScopeData(ScopeData scopeData) {
        this.scopeData = scopeData;
    }

    public String getAccessID() {
        return accessID;
    }

    public void setAccessID(String accessID) {
        this.accessID = accessID;
    }

    public AccessData getAccessData() {
        return accessData;
    }

    public void setAccessData(AccessData accessData) {
        this.accessData = accessData;
    }
}
