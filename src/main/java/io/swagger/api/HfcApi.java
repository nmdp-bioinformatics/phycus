package io.swagger.api;

import io.swagger.model.*;

import io.swagger.annotations.*;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-05-30T13:04:33.940Z")

@Api(value = "hfc", description = "the hfc API")
public interface HfcApi {

    @ApiOperation(value = "", notes = "Gets a list of all submission data sets ", response = HFCurationResponseList.class, tags={  })
    @ApiResponses(value = { 
        @ApiResponse(code = 200, message = "Successful response", response = HFCurationResponseList.class),
        @ApiResponse(code = 500, message = "An unexpected error ocurred", response = HFCurationResponseList.class) })
    @RequestMapping(value = "/hfc",
        method = RequestMethod.GET)
    ResponseEntity<HFCurationResponseList> hfcGet();


    @ApiOperation(value = "", notes = "Get a list of all populations ", response = PopulationResponse.class, tags={  })
    @ApiResponses(value = { 
        @ApiResponse(code = 200, message = "Successful response", response = PopulationResponse.class),
        @ApiResponse(code = 500, message = "An unexpected error ocurred", response = PopulationResponse.class) })
    @RequestMapping(value = "/hfc/population",
        method = RequestMethod.GET)
    ResponseEntity<PopulationResponse> hfcPopulationGet();


    @ApiOperation(value = "", notes = "Returns a population with its attached submissions", response = PopulationSubmissionResponse.class, tags={  })
    @ApiResponses(value = { 
        @ApiResponse(code = 200, message = "Returns the population including all attached submissions", response = PopulationSubmissionResponse.class),
        @ApiResponse(code = 500, message = "An unexpected error ocurred", response = PopulationSubmissionResponse.class) })
    @RequestMapping(value = "/hfc/population/{populationId}",
        method = RequestMethod.GET)
    ResponseEntity<PopulationSubmissionResponse> hfcPopulationPopulationIdGet(@ApiParam(value = "The population id",required=true ) @PathVariable("populationId") String populationId);


    @ApiOperation(value = "", notes = "Storing of a new Haplotype Frequency set. ", response = HFCurationResponse.class, tags={  })
    @ApiResponses(value = { 
        @ApiResponse(code = 200, message = "Successful response", response = HFCurationResponse.class),
        @ApiResponse(code = 500, message = "An unexpected error ocurred", response = HFCurationResponse.class) })
    @RequestMapping(value = "/hfc",
        method = RequestMethod.POST)
    ResponseEntity<HFCurationResponse> hfcPost(@ApiParam(value = "Haplotype Frequency Curation Data" ,required=true ) @RequestBody HFCurationRequest hfCurationRequest);


    @ApiOperation(value = "", notes = "Returns the list of haplotypes attached to the given submission", response = CohortData.class, tags={  })
    @ApiResponses(value = { 
        @ApiResponse(code = 200, message = "Returns the cohort data and genotypes if available", response = CohortData.class),
        @ApiResponse(code = 500, message = "An unexpected error ocurred", response = CohortData.class) })
    @RequestMapping(value = "/hfc/{submissionId}/cohort",
        method = RequestMethod.GET)
    ResponseEntity<CohortData> hfcSubmissionIdCohortGet(@ApiParam(value = "The submission id",required=true ) @PathVariable("submissionId") String submissionId);


    @ApiOperation(value = "", notes = "Returns a submission of haplotypes", response = HFCurationResponse.class, tags={  })
    @ApiResponses(value = { 
        @ApiResponse(code = 200, message = "Returns the data set containing all references", response = HFCurationResponse.class),
        @ApiResponse(code = 500, message = "An unexpected error ocurred", response = HFCurationResponse.class) })
    @RequestMapping(value = "/hfc/{submissionId}",
        method = RequestMethod.GET)
    ResponseEntity<HFCurationResponse> hfcSubmissionIdGet(@ApiParam(value = "The submission id that the haplotype frequencies were submitted under",required=true ) @PathVariable("submissionId") String submissionId);


    @ApiOperation(value = "", notes = "Returns the list of haplotypes attached to the given submission", response = HaplotypeFrequencyData.class, tags={  })
    @ApiResponses(value = { 
        @ApiResponse(code = 200, message = "Returns the haplotype frequency data", response = HaplotypeFrequencyData.class),
        @ApiResponse(code = 500, message = "An unexpected error ocurred", response = HaplotypeFrequencyData.class) })
    @RequestMapping(value = "/hfc/{submissionId}/haplotypes",
        method = RequestMethod.GET)
    ResponseEntity<HaplotypeFrequencyData> hfcSubmissionIdHaplotypesGet(@ApiParam(value = "The submission id",required=true ) @PathVariable("submissionId") String submissionId);


    @ApiOperation(value = "", notes = "Returns the labels associated to the submission", response = LabelData.class, tags={  })
    @ApiResponses(value = { 
        @ApiResponse(code = 200, message = "Returns label set", response = LabelData.class),
        @ApiResponse(code = 500, message = "An unexpected error ocurred", response = LabelData.class) })
    @RequestMapping(value = "/hfc/{submissionId}/labels",
        method = RequestMethod.GET)
    ResponseEntity<LabelData> hfcSubmissionIdLabelsGet(@ApiParam(value = "The submission id",required=true ) @PathVariable("submissionId") String submissionId);


    @ApiOperation(value = "", notes = "Returns the population of the given submission", response = PopulationData.class, tags={  })
    @ApiResponses(value = { 
        @ApiResponse(code = 200, message = "Returns the population", response = PopulationData.class),
        @ApiResponse(code = 500, message = "An unexpected error ocurred", response = PopulationData.class) })
    @RequestMapping(value = "/hfc/{submissionId}/population",
        method = RequestMethod.GET)
    ResponseEntity<PopulationData> hfcSubmissionIdPopulationGet(@ApiParam(value = "The submission id",required=true ) @PathVariable("submissionId") String submissionId);


    @ApiOperation(value = "", notes = "Returns the scope of the genotypes used for creating the submitted haplotypes", response = ScopeData.class, tags={  })
    @ApiResponses(value = { 
        @ApiResponse(code = 200, message = "Returns scope set", response = ScopeData.class),
        @ApiResponse(code = 500, message = "An unexpected error ocurred", response = ScopeData.class) })
    @RequestMapping(value = "/hfc/{submissionId}/scope",
        method = RequestMethod.GET)
    ResponseEntity<ScopeData> hfcSubmissionIdScopeGet(@ApiParam(value = "The submission id",required=true ) @PathVariable("submissionId") String submissionId);

}
