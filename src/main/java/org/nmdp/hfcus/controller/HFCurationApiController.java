package org.nmdp.hfcus.controller;

import io.swagger.annotations.ApiParam;
import io.swagger.api.HfcApi;
import io.swagger.model.CohortData;
import io.swagger.model.Error;
import io.swagger.model.HFCurationListResponse;
import io.swagger.model.HFCurationRequest;
import io.swagger.model.HFCurationResponse;
import io.swagger.model.HaplotypeFrequencyData;
import io.swagger.model.LabelData;
import io.swagger.model.PopulationData;
import io.swagger.model.PopulationResponse;
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
import org.nmdp.hfcus.model.*;
import org.nmdp.hfcus.model.exceptions.RequiredFieldInvalidException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;

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

    private <T> ResponseEntity<T> RetrieveSubdataFromDatabase(Long submissionId, Function<HFCuration, ICurationDataModel<T>> converter){
        HFCuration curation = repositoryContainer.getCurationRepository().findOne(submissionId);
        ResponseEntity<T> responseEntity;
        if (curation != null){
            ICurationDataModel<T> dataModel = converter.apply(curation);
            if (dataModel != null) {
                responseEntity = ResponseEntity.ok(dataModel.toSwaggerObject());
            }
            else
            {
                responseEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        }
        else
        {
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
            return ResponseEntity.ok(curation.toSwaggerObject());
        }

        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    @Override
    public ResponseEntity<HaplotypeFrequencyData> hfcSubmissionIdHaplotypesGet(
            @ApiParam(value = "The submission id",required=true ) @PathVariable("submissionId") Long submissionId
    ){
        return RetrieveSubdataFromDatabase(submissionId, (curation) -> curation.getHaplotypeFrequencyData());
    }

    @Override
    public ResponseEntity<PopulationResponse> hfcPopulationGet() {
        PopulationResponse response = new PopulationResponse();

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
        Population population = repositoryContainer.getPopulationRepository().findOne(populationId);
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
        }
        else
        {
            responseEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return responseEntity;
    }

    @Override
    public ResponseEntity<CohortData> hfcSubmissionIdCohortGet(
            @ApiParam(value = "The submission id",required=true ) @PathVariable("submissionId") Long submissionId
    ) {
        return RetrieveSubdataFromDatabase(submissionId, (curation) -> curation.getCohortData());
    }

    @Override
    public ResponseEntity<HFCurationResponse> hfcSubmissionIdGet(
            @ApiParam(value = "The submission id that the haplotype frequencies were submitted under",required=true ) @PathVariable("submissionId") Long submissionId
    ) {
        HFCuration curation = repositoryContainer.getCurationRepository().findOne(submissionId);
        ResponseEntity<HFCurationResponse> responseEntity;
        if (curation != null)
        {
            responseEntity = ResponseEntity.ok(curation.toSwaggerObject());
        }
        else
        {
            responseEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return responseEntity;
    }

    @Override
    public ResponseEntity<Void> hfcSubmissionIdDelete(
            @ApiParam(value = "",required=true ) @PathVariable("submissionId") Long submissionId
    ) {
        HFCuration curation = repositoryContainer.getCurationRepository().findOne(submissionId);
          if (curation!=null){
            curation.setPopulationData(null);
            repositoryContainer.getCurationRepository().delete(curation);
            return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
          }
          else{
            return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
          }
    }

    @Override
    public ResponseEntity<LabelData> hfcSubmissionIdLabelsGet(
            @ApiParam(value = "The submission id",required=true ) @PathVariable("submissionId") Long submissionId
    ) {
        return RetrieveSubdataFromDatabase(submissionId, (curation) -> curation.getLabelData());
    }

    @Override
    public ResponseEntity<PopulationData> hfcSubmissionIdPopulationGet(
            @ApiParam(value = "The submission id",required=true ) @PathVariable("submissionId") Long submissionId
    ) {
        return RetrieveSubdataFromDatabase(submissionId, (curation) -> curation.getPopulationData());
    }

    @Override
    public ResponseEntity<ScopeData> hfcSubmissionIdScopeGet(
            @ApiParam(value = "The submission id",required=true ) @PathVariable("submissionId") Long submissionId
    ) {
        return RetrieveSubdataFromDatabase(submissionId, (curation) -> curation.getScopeData());
    }
}
