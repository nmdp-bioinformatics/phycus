package org.nmdp.hfcus.controller;

import io.swagger.annotations.ApiParam;
import io.swagger.api.PopulationApi;
import io.swagger.model.PopulationData;
import io.swagger.model.PopulationRequest;
import io.swagger.model.PopulationResponse;
import org.nmdp.hfcus.dao.PopulationRepository;
import org.nmdp.hfcus.model.Population;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import javax.validation.Valid;

@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-11-09T08:56:00.747-06:00")

@Controller
public class PopulationApiController implements PopulationApi {

    private PopulationRepository populationRepository;

    @Autowired
    public PopulationApiController(PopulationRepository populationRepository) {
        this.populationRepository = populationRepository;
    }

    @Override
    public ResponseEntity<PopulationData> createPopulation(@ApiParam(value = "Population Request" ,required=true )  @Valid @RequestBody PopulationRequest populationRequest) {
        Population population = new Population(populationRequest.getName(), populationRequest.getDescription());
        population = populationRepository.save(population);
        return ResponseEntity.ok(population.toSwaggerObject());
    }

    @Override
    public ResponseEntity<PopulationData> getPopulationForId(@ApiParam(value = "Population ID",required=true ) @PathVariable("populationId") Long populationId) {
        Population population = populationRepository.findById(populationId).orElse(null);
        ResponseEntity<PopulationData> responseEntity;
        if (population != null) {
            responseEntity = ResponseEntity.ok(population.toSwaggerObject());
        }
        else
        {
            responseEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return responseEntity;
    }

    @Override
    public ResponseEntity<PopulationResponse> getAllPopulations() {
        Iterable<Population> populations = populationRepository.findAll();
        PopulationResponse response = new PopulationResponse();
        for (Population population : populations) {
            response.addPopulationListItem(population.toSwaggerObject());
        }
        return ResponseEntity.ok(response);
    }
}
