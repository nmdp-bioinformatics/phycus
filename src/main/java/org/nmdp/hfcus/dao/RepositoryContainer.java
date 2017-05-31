package org.nmdp.hfcus.dao;

import org.springframework.data.repository.CrudRepository;

public class RepositoryContainer {

    private HFCurationRepository curationRepository;
    private PopulationRepository populationRepository;
    private CohortRepository cohortRepository;
    private MethodSetRepository methodSetRepository;
    private LabelSetRepository labelSetRepository;
    private HaplotypeFrequencySetRepository haplotypeFrequencySetRepository;
    private AccessRepository accessRepository;
    private ScopeListRepository scopeListRepository;

    public HFCurationRepository getCurationRepository() {
        return curationRepository;
    }

    public void setCurationRepository(HFCurationRepository curationRepository) {
        this.curationRepository = curationRepository;
    }

    public PopulationRepository getPopulationRepository() {
        return populationRepository;
    }

    public void setPopulationRepository(PopulationRepository populationRepository) {
        this.populationRepository = populationRepository;
    }

    public CohortRepository getCohortRepository() {
        return cohortRepository;
    }

    public void setCohortRepository(CohortRepository cohortRepository) {
        this.cohortRepository = cohortRepository;
    }

    public MethodSetRepository getMethodSetRepository() {
        return methodSetRepository;
    }

    public void setMethodSetRepository(MethodSetRepository methodSetRepository) {
        this.methodSetRepository = methodSetRepository;
    }

    public LabelSetRepository getLabelSetRepository() {
        return labelSetRepository;
    }

    public void setLabelSetRepository(LabelSetRepository labelSetRepository) {
        this.labelSetRepository = labelSetRepository;
    }

    public HaplotypeFrequencySetRepository getHaplotypeFrequencySetRepository() {
        return haplotypeFrequencySetRepository;
    }

    public void setHaplotypeFrequencySetRepository(HaplotypeFrequencySetRepository haplotypeFrequencySetRepository) {
        this.haplotypeFrequencySetRepository = haplotypeFrequencySetRepository;
    }

    public AccessRepository getAccessRepository() {
        return accessRepository;
    }

    public void setAccessRepository(AccessRepository accessRepository) {
        this.accessRepository = accessRepository;
    }

    public ScopeListRepository getScopeListRepository() {
        return scopeListRepository;
    }

    public void setScopeListRepository(ScopeListRepository scopeListRepository) {
        this.scopeListRepository = scopeListRepository;
    }
}
