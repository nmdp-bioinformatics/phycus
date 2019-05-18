package org.nmdp.hfcus.model;

import java.io.Serializable;
import java.util.Objects;
import java.util.Optional;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.nmdp.hfcus.dao.RepositoryContainer;
import org.nmdp.hfcus.model.exceptions.RequiredFieldInvalidException;

import io.swagger.model.HFCurationRequest;
import io.swagger.model.HFCurationResponse;

@Entity
@Data
@NoArgsConstructor
public class HFCuration implements Serializable, ICurationDataModel<HFCurationResponse> {

    /**
	 * 
	 */
	private static final long serialVersionUID = 3603411156062614289L;

    public HFCuration(RepositoryContainer repositoryContainer, HFCurationRequest data) {
        // Require a populationData ID
        if (data.getPopulationID() == null){
            throw new RequiredFieldInvalidException("Requires Population ID");
        }

        populationData = repositoryContainer
                .getPopulationRepository()
                .findById(data.getPopulationID())
                .orElseThrow(() -> new RequiredFieldInvalidException("Not a valid Population ID"));

        cohortData = repositoryContainer
                .getCohortRepository()
                .findById(data.getCohortID())
                .orElseThrow(() -> new RequiredFieldInvalidException("Not a valid Cohort ID"));

        if (data.getMethodData() != null){
            methodData = new MethodSet(data.getMethodData());
        }else if (data.getMethodSetID() != null){
            methodData = repositoryContainer
                    .getMethodSetRepository()
                    .findById(data.getMethodSetID())
                    .orElse(null);
        }

        if (data.getLabelData() != null){
            labelData = new LabelSet(data.getLabelData());
        }else if (data.getLabelID() != null){
            labelData = repositoryContainer
                    .getLabelSetRepository()
                    .findById(data.getLabelID())
                    .orElse(null);
        }

        if (data.getHaplotypeFrequencyData() != null){
            haplotypeFrequencyData = new HaplotypeFrequencySet(data.getHaplotypeFrequencyData());
        }else if (data.getHaplotypeFrequencyDataID() != null && !Objects.equals(data.getHaplotypeFrequencyDataID(), "")){
            haplotypeFrequencyData = repositoryContainer
                    .getHaplotypeFrequencySetRepository()
                    .findById(data.getHaplotypeFrequencyDataID())
                    .orElse(null);
        }

        if (data.getAccessData() != null){
            accessData = new Access(data.getAccessData());
        }else if (data.getAccessID() != null){
            accessData = repositoryContainer
                    .getAccessRepository()
                    .findById(data.getAccessID())
                    .orElse(null);
        }

        if (data.getScopeData() != null){
            scopeData = new ScopeList(data.getScopeData());
        }else if (data.getScopeID() != null){
            scopeData = repositoryContainer
                    .getScopeListRepository()
                    .findById(data.getScopeID())
                    .orElse(null);
        }
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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
