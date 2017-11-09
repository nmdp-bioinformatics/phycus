package org.nmdp.hfcus.controller;

import io.swagger.annotations.ApiParam;
import io.swagger.api.HfcApi;
import io.swagger.model.CohortData;
import io.swagger.model.HFCurationListResponse;
import io.swagger.model.HFCurationRequest;
import io.swagger.model.HFCurationResponse;
import io.swagger.model.HaplotypeFrequencyData;
import io.swagger.model.HfcPopulationResponse;
import io.swagger.model.LabelData;
import io.swagger.model.PopulationData;
import io.swagger.model.PopulationSubmissionData;
import io.swagger.model.PopulationSubmissionResponse;
import io.swagger.model.ScopeData;
import org.nmdp.hfcus.dao.AccessRepository;
import org.nmdp.hfcus.dao.CohortRepository;
import org.nmdp.hfcus.dao.HFCurationRepository;
import org.nmdp.hfcus.dao.HaplotypeFrequencySetRepository;
import org.nmdp.hfcus.dao.LabelSetRepository;
import org.nmdp.hfcus.dao.MethodSetRepository;
import org.nmdp.hfcus.dao.PopulationRepository;
import org.nmdp.hfcus.dao.RepositoryContainer;
import org.nmdp.hfcus.dao.ScopeListRepository;
import org.nmdp.hfcus.model.Cohort;
import org.nmdp.hfcus.model.HFCuration;
import org.nmdp.hfcus.model.LabelSet;
import org.nmdp.hfcus.model.Population;
import org.nmdp.hfcus.model.ScopeList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class HFCurationApiController implements HfcApi{

    private final RepositoryContainer repositoryContainer;

    @Autowired
    public HFCurationApiController(
            HFCurationRepository curationRepository,
            PopulationRepository populationRepository,
            CohortRepository cohortRepository,
            MethodSetRepository methodSetRepository,
            LabelSetRepository labelSetRepository,
            HaplotypeFrequencySetRepository haplotypeFrequencySetRepository,
            AccessRepository accessRepository,
            ScopeListRepository scopeListRepository
    ) {
        this.repositoryContainer = new RepositoryContainer();
        repositoryContainer.setCurationRepository(curationRepository);
        repositoryContainer.setPopulationRepository(populationRepository);
        repositoryContainer.setCohortRepository(cohortRepository);
        repositoryContainer.setMethodSetRepository(methodSetRepository);
        repositoryContainer.setLabelSetRepository(labelSetRepository);
        repositoryContainer.setHaplotypeFrequencySetRepository(haplotypeFrequencySetRepository);
        repositoryContainer.setAccessRepository(accessRepository);
        repositoryContainer.setScopeListRepository(scopeListRepository);
    }

    @Override
    public ResponseEntity<HFCurationListResponse> hfcGet() {

        HFCurationListResponse response = new HFCurationListResponse();

        Iterable<HFCuration> curations = repositoryContainer.getCurationRepository().findAll();
        for (HFCuration curation : curations) {
            response.addHfCurationResponsesItem(curation.toSwaggerObject());
        }

        return ResponseEntity.ok(response);
    }

    @Override
    public ResponseEntity<HFCurationResponse> hfcPost(@RequestBody HFCurationRequest hfCurationRequest) {
        if (hfCurationRequest != null) {
            HFCuration curation = new HFCuration(repositoryContainer, hfCurationRequest);
            curation = repositoryContainer.getCurationRepository().save(curation);
            return ResponseEntity.ok(curation.toSwaggerObject());
        }

        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    @Override
    public ResponseEntity<HaplotypeFrequencyData> hfcSubmissionIdHaplotypesGet(
            @ApiParam(value = "The submission id",required=true ) @PathVariable("submissionId") Long submissionId
    ){
        HFCuration curation = repositoryContainer.getCurationRepository().findOne(submissionId);
        return ResponseEntity.ok(curation.getHaplotypeFrequencyData().toSwaggerObject());
    }

    @Override
    public ResponseEntity<HfcPopulationResponse> hfcPopulationGet() {
        HfcPopulationResponse response = new HfcPopulationResponse();

        Iterable<Population> populations = repositoryContainer.getPopulationRepository().findAll();
        for (Population data: populations){
            response.addPopulationListItem(data.toSwaggerObject());
        }
        return ResponseEntity.ok(response);
    }

    @Override
    public ResponseEntity<PopulationSubmissionResponse> hfcPopulationPopulationIdGet(
            @ApiParam(value = "The populationId id",required=true ) @PathVariable("populationId") Long populationId
    ) {
        PopulationSubmissionResponse response = new PopulationSubmissionResponse();
        Iterable<HFCuration> curations = repositoryContainer.getCurationRepository().findBypopulationDataId(populationId);
        PopulationSubmissionData pop = new PopulationSubmissionData();
        Population population = repositoryContainer.getPopulationRepository().findOne(populationId);
        pop.setPopulation(population.toSwaggerObject());
        List<Long> subs = new ArrayList<>();
        for (HFCuration curation: curations) {
            subs.add(curation.getId());
        }
        pop.setSubmissions(subs);
        response.addPopulationSubmissionListItem(pop);
        return ResponseEntity.ok(response);
    }

    @Override
    public ResponseEntity<CohortData> hfcSubmissionIdCohortGet(
            @ApiParam(value = "The submission id",required=true ) @PathVariable("submissionId") Long submissionId
    ) {
        Cohort cohort = repositoryContainer.getCurationRepository().findOne(submissionId).getCohortData();
        return ResponseEntity.ok(cohort.toSwaggerObject());
    }

    @Override
    public ResponseEntity<HFCurationResponse> hfcSubmissionIdGet(
            @ApiParam(value = "The submission id that the haplotype frequencies were submitted under",required=true ) @PathVariable("submissionId") Long submissionId
    ) {
        return ResponseEntity.ok(repositoryContainer.getCurationRepository().findOne(submissionId).toSwaggerObject());
    }

    @Override
    public ResponseEntity<LabelData> hfcSubmissionIdLabelsGet(
            @ApiParam(value = "The submission id",required=true ) @PathVariable("submissionId") Long submissionId
    ) {
        LabelSet label = repositoryContainer.getCurationRepository().findOne(submissionId).getLabelData();
        return ResponseEntity.ok(label.toSwaggerObject());
    }

    @Override
    public ResponseEntity<PopulationData> hfcSubmissionIdPopulationGet(
            @ApiParam(value = "The submission id",required=true ) @PathVariable("submissionId") Long submissionId
    ) {
        Population population = repositoryContainer.getCurationRepository().findOne(submissionId).getPopulationData();
        return ResponseEntity.ok(population.toSwaggerObject());
    }

    @Override
    public ResponseEntity<ScopeData> hfcSubmissionIdScopeGet(
            @ApiParam(value = "The submission id",required=true ) @PathVariable("submissionId") Long submissionId
    ) {
        ScopeList scopeList = repositoryContainer.getCurationRepository().findOne(submissionId).getScopeData();
        return ResponseEntity.ok(scopeList.toSwaggerObject());
    }
}