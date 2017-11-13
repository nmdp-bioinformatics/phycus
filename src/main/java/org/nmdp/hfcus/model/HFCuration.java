package org.nmdp.hfcus.model;

import io.swagger.model.*;
import org.nmdp.hfcus.dao.RepositoryContainer;

import javax.persistence.*;

import java.io.Serializable;
import java.util.Objects;

@Entity
public class HFCuration implements Serializable, ICurationDataModel<HFCurationResponse> {

    public HFCuration(){
        // intentionally left empty
    }

    public HFCuration(RepositoryContainer repositoryContainer, HFCurationRequest data){
        // Require a populationData ID
        if (data.getPopulationID() == null){
            throw new RuntimeException("Requires Population ID");
        }
        populationData = repositoryContainer.getPopulationRepository().findOne(data.getPopulationID());
        if (populationData == null) {
            throw new RuntimeException("Not a valid Population ID");
        }
        if (data.getCohortData() != null){
            cohortData = new Cohort(data.getCohortData());
        }else if (data.getCohortData() != null){
            cohortData = repositoryContainer.getCohortRepository().findOne(data.getCohortID());
        }

        if (data.getMethodData() != null){
            methodData = new MethodSet(data.getMethodData());
        }else if (data.getMethodSetID() != null){
            methodData = repositoryContainer.getMethodSetRepository().findOne(data.getMethodSetID());
        }

        if (data.getLabelData() != null){
            labelData = new LabelSet(data.getLabelData());
        }else if (data.getLabelID() != null){
            labelData = repositoryContainer.getLabelSetRepository().findOne(data.getLabelID());
        }

        if (data.getHaplotypeFrequencyData() != null){
            haplotypeFrequencyData = new HaplotypeFrequencySet(data.getHaplotypeFrequencyData());
        }else if (data.getHaplotypeFrequencyDataID() != null && !Objects.equals(data.getHaplotypeFrequencyDataID(), "")){
            haplotypeFrequencyData = repositoryContainer.getHaplotypeFrequencySetRepository().findOne(data.getHaplotypeFrequencyDataID());
        }

        if (data.getAccessData() != null){
            accessData = new Access(data.getAccessData());
        }else if (data.getAccessID() != null){
            accessData = repositoryContainer.getAccessRepository().findOne(data.getAccessID());
        }

        if (data.getScopeData() != null){
            scopeData = new ScopeList(data.getScopeData());
        }else if (data.getScopeID() != null){
            scopeData = repositoryContainer.getScopeListRepository().findOne(data.getScopeID());
        }
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne(cascade = CascadeType.ALL)
    private Population populationData;

    @ManyToOne(cascade = CascadeType.ALL)
    private Cohort cohortData;

    @ManyToOne(cascade = CascadeType.ALL)
    private MethodSet methodData;

    @ManyToOne(cascade = CascadeType.ALL)
    private LabelSet labelData;

    @ManyToOne(cascade = CascadeType.ALL)
    private HaplotypeFrequencySet haplotypeFrequencyData;

    @ManyToOne(cascade = CascadeType.ALL)
    private ScopeList scopeData;

    @ManyToOne(cascade = CascadeType.ALL)
    private Access accessData;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Population getPopulationData() {
        return populationData;
    }

    public void setPopulationData(Population populationData) {
        this.populationData = populationData;
    }

    public Cohort getCohortData() {
        return cohortData;
    }

    public void setCohortData(Cohort cohortData) {
        this.cohortData = cohortData;
    }

    public MethodSet getMethodData() {
        return methodData;
    }

    public void setMethodData(MethodSet methodData) {
        this.methodData = methodData;
    }

    public LabelSet getLabelData() {
        return labelData;
    }

    public void setLabelData(LabelSet labelData) {
        this.labelData = labelData;
    }

    public HaplotypeFrequencySet getHaplotypeFrequencyData() {
        return haplotypeFrequencyData;
    }

    public void setHaplotypeFrequencyData(HaplotypeFrequencySet haplotypeFrequencyData) {
        this.haplotypeFrequencyData = haplotypeFrequencyData;
    }

    public ScopeList getScopeData() {
        return scopeData;
    }

    public void setScopeData(ScopeList scopeData) {
        this.scopeData = scopeData;
    }

    public Access getAccessData() {
        return accessData;
    }

    public void setAccessData(Access accessData) {
        this.accessData = accessData;
    }

    @Override
    public HFCurationResponse toSwaggerObject(){
        HFCurationResponse data = new HFCurationResponse();
        data.setSubmissionID(id);
        if (populationData != null){
            data.setPopulationID(populationData.getId());
        }
        if(cohortData != null){
            data.setCohortID(cohortData.getId());
        }
        if (methodData != null){
            data.setMethodSetID(methodData.getId());
        }
        if (labelData != null){
            data.setLabelID(labelData.getId());
        }
        if (haplotypeFrequencyData != null){
            data.setHaplotypeListID(haplotypeFrequencyData.getId());
        }
        if (scopeData != null){
            data.setScopeID(scopeData.getId());
        }
        if (accessData != null){
            data.setAccessID(accessData.getId());
        }
        return data;
    }
}
