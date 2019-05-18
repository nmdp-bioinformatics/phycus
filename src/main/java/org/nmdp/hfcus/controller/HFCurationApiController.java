package org.nmdp.hfcus.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;

import javax.validation.Valid;

import io.swagger.model.*;
import io.swagger.model.Quality;
import org.nmdp.hfcus.dao.AccessRepository;
import org.nmdp.hfcus.dao.CohortRepository;
import org.nmdp.hfcus.dao.HFCurationRepository;
import org.nmdp.hfcus.dao.HaplotypeFrequencySetRepository;
import org.nmdp.hfcus.dao.LabelSetRepository;
import org.nmdp.hfcus.dao.MethodSetRepository;
import org.nmdp.hfcus.dao.PopulationRepository;
import org.nmdp.hfcus.dao.RepositoryContainer;
import org.nmdp.hfcus.dao.ScopeListRepository;
import org.nmdp.hfcus.model.*;
import org.nmdp.hfcus.quality.QualityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import io.swagger.annotations.ApiParam;
import io.swagger.api.HfcApi;

@Controller
public class HFCurationApiController implements HfcApi {

    private final RepositoryContainer repositoryContainer;
    private final QualityService qualityService;

    @Autowired
    public HFCurationApiController(
            HFCurationRepository curationRepository,
            PopulationRepository populationRepository,
            CohortRepository cohortRepository,
            MethodSetRepository methodSetRepository,
            LabelSetRepository labelSetRepository,
            HaplotypeFrequencySetRepository haplotypeFrequencySetRepository,
            AccessRepository accessRepository,
            ScopeListRepository scopeListRepository,
            QualityService qualityService
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
        this.qualityService = qualityService;
        try {
            qualityService.run();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    private <ModelType, ResponseType> ResponseEntity<ResponseType> RetrieveSubdataFromDatabase(
            Long submissionId,
            Function<HFCuration, ModelType> getDataItem,
            Function<ModelType, ResponseType> converter
    ) {
        ResponseEntity<ResponseType> responseEntity;
        HFCuration curation = repositoryContainer.getCurationRepository().findById(submissionId).orElse(null);
        if (curation != null) {
            ModelType dataModel = getDataItem.apply(curation);
            if (dataModel != null) {
                responseEntity = ResponseEntity.ok(converter.apply(dataModel));
            } else {
                responseEntity = new ResponseEntity<>(HttpStatus.OK);
            }
        } else {
            responseEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return responseEntity;
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
    public ResponseEntity<HFCurationResponse> hfcPost(@Valid @RequestBody HFCurationRequest hfCurationRequest) {
        if (hfCurationRequest != null) {
            HFCuration curation = new HFCuration(repositoryContainer, hfCurationRequest);
            curation = repositoryContainer.getCurationRepository().save(curation);
            try {
                qualityService.addToQueue(curation);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                throw new RuntimeException(e);
            }
            return ResponseEntity.ok(curation.toSwaggerObject());
        }

        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    @Override
    public ResponseEntity<HaplotypeFrequencyData> hfcSubmissionIdHaplotypesGet(
            @ApiParam(value = "The submission id", required = true) @PathVariable("submissionId") Long submissionId
    ) {
        return RetrieveSubdataFromDatabase(submissionId, HFCuration::getHaplotypeFrequencyData, HaplotypeFrequencySet::toSwaggerObject);
    }

    @Override
    public ResponseEntity<PopulationResponse> hfcPopulationGet() {
        PopulationResponse response = new PopulationResponse();

        Iterable<Population> populations = repositoryContainer.getPopulationRepository().findAll();
        for (Population data : populations) {
            response.addPopulationListItem(data.toSwaggerObject());
        }
        return ResponseEntity.ok(response);
    }

    @Override
    public ResponseEntity<LabelResponse> hfcLabelGet() {
        LabelResponse response = new LabelResponse();
        Iterable<LabelSet> labels = repositoryContainer.getLabelSetRepository().findAll();
        List<LabelData> labelsList = new ArrayList<>();
        LabelData labelData;
        for (LabelSet labelSet : labels) {
            labelData = labelSet.toSwaggerObject();

            if (!labelsList.contains(labelData)) {
                labelsList.add(labelData);
            }
        }
        response.setLabelsList(labelsList);
        return ResponseEntity.ok(response);
    }

    @Override
    public ResponseEntity<PopulationSubmissionResponse> hfcPopulationPopulationIdGet(
            @ApiParam(value = "The populationId id", required = true) @PathVariable("populationId") Long populationId
    ) {
        Population population = repositoryContainer.getPopulationRepository().findById(populationId).orElse(null);
        ResponseEntity<PopulationSubmissionResponse> responseEntity;
        if (population != null) {
            PopulationSubmissionData pop = new PopulationSubmissionData();
            pop.setPopulation(population.toSwaggerObject());
            Iterable<HFCuration> curations = repositoryContainer.getCurationRepository().findBypopulationDataId(populationId);
            List<Long> subs = new ArrayList<>();
            for (HFCuration curation : curations) {
                subs.add(curation.getId());
            }
            pop.setSubmissions(subs);
            PopulationSubmissionResponse response = new PopulationSubmissionResponse();
            response.addPopulationSubmissionListItem(pop);

            responseEntity = ResponseEntity.ok(response);
        } else {
            responseEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return responseEntity;
    }

    @Override
    public ResponseEntity<CohortData> hfcSubmissionIdCohortGet(
            @ApiParam(value = "The submission id", required = true) @PathVariable("submissionId") Long submissionId
    ) {
        return RetrieveSubdataFromDatabase(submissionId, HFCuration::getCohortData, Cohort::toSwaggerObject);
    }

    @Override
    public ResponseEntity<HFCurationResponse> hfcSubmissionIdGet(
            @ApiParam(value = "The submission id that the haplotype frequencies were submitted under", required = true) @PathVariable("submissionId") Long submissionId
    ) {
        return RetrieveSubdataFromDatabase(submissionId, hfCuration -> hfCuration, HFCuration::toSwaggerObject);
    }

    @Override
    public ResponseEntity<Void> hfcSubmissionIdDelete(
            @ApiParam(value = "", required = true) @PathVariable("submissionId") Long submissionId
    ) {
        HFCuration curation = repositoryContainer.getCurationRepository().findById(submissionId).orElse(null);
        if (curation != null) {
            curation.setPopulationData(null);
            repositoryContainer.getCurationRepository().delete(curation);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @Override
    public ResponseEntity<LabelData> hfcSubmissionIdLabelsGet(
            @ApiParam(value = "The submission id", required = true) @PathVariable("submissionId") Long submissionId
    ) {
        return RetrieveSubdataFromDatabase(submissionId, HFCuration::getLabelData, LabelSet::toSwaggerObject);
    }

    @Override
    public ResponseEntity<PopulationData> hfcSubmissionIdPopulationGet(
            @ApiParam(value = "The submission id", required = true) @PathVariable("submissionId") Long submissionId
    ) {
        return RetrieveSubdataFromDatabase(submissionId, HFCuration::getPopulationData, Population::toSwaggerObject);
    }

    @Override
    public ResponseEntity<ScopeData> hfcSubmissionIdScopeGet(
            @ApiParam(value = "The submission id", required = true) @PathVariable("submissionId") Long submissionId
    ) {
        return RetrieveSubdataFromDatabase(submissionId, HFCuration::getScopeData, ScopeList::toSwaggerObject);
    }

    @Override
    public ResponseEntity<List<Quality>> hfcSubmissionIdQualityGet(Long submissionId) {
        return RetrieveSubdataFromDatabase(submissionId, hfCuration -> hfCuration.getHaplotypeFrequencyData().getQualityList(), qualities -> {
            List<Quality> qualityList = new ArrayList<>();
            for (org.nmdp.hfcus.model.Quality dbQuality : qualities) {
                qualityList.add(dbQuality.toSwaggerObject());
            }
            return qualityList;
        });
    }
}
