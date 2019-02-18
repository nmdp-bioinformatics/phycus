package org.nmdp.hfcus.controller;

import javax.validation.Valid;

import org.nmdp.hfcus.dao.CohortRepository;
import org.nmdp.hfcus.model.Cohort;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import io.swagger.annotations.ApiParam;
import io.swagger.api.CohortApi;
import io.swagger.model.CohortData;
import io.swagger.model.CohortRequest;
import io.swagger.model.CohortResponse;

@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-11-09T08:56:00.747-06:00")

@Controller
public class CohortApiController implements CohortApi {

    private CohortRepository cohortRepository;

    @Autowired
    public CohortApiController(CohortRepository cohortRepository) {
        this.cohortRepository = cohortRepository;
    }

    @Override
    public ResponseEntity<CohortData> createCohort(@ApiParam(value = "Cohort Request" ,required=true )  @Valid @RequestBody CohortRequest cohortRequest) {
        Cohort cohort = new Cohort(cohortRequest.getCohortData());
        cohort = cohortRepository.save(cohort);
        return ResponseEntity.ok(cohort.toSwaggerObject());
    }

    @Override
    public ResponseEntity<CohortData> getCohortForId(@ApiParam(value = "Cohort ID",required=true ) @PathVariable("cohortId") Long cohortId) {
        Cohort cohort = cohortRepository.findById(cohortId).orElse(null);
        ResponseEntity<CohortData> responseEntity;
        if (cohort != null) {
            responseEntity = ResponseEntity.ok(cohort.toSwaggerObject());
        }
        else
        {
            responseEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return responseEntity;
    }

    @Override
    public ResponseEntity<CohortResponse> getAllCohorts() {
        Iterable<Cohort> cohorts = cohortRepository.findAll();
        CohortResponse response = new CohortResponse();
        for (Cohort cohort : cohorts) {
            response.addCohortsListItem(cohort.toSwaggerObject());
        }
        return ResponseEntity.ok(response);
    }
}
