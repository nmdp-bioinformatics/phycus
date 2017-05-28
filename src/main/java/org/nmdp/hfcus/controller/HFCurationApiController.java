package org.nmdp.hfcus.controller;

import io.swagger.api.HfcApi;
import io.swagger.model.HFCurationListResponse;
import io.swagger.model.HFCurationRequest;
import io.swagger.model.HFCurationResponse;
import org.nmdp.hfcus.dao.HFCurationRepository;
import org.nmdp.hfcus.model.HFCuration;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@Controller
public class HFCurationApiController implements HfcApi{

    private HFCurationRepository curationRepository;

    @Autowired
    public HFCurationApiController(HFCurationRepository curationRepository) {
        this.curationRepository = curationRepository;
    }

    @Override
    public ResponseEntity<HFCurationListResponse> hfcGet() {

        HFCurationListResponse response = new HFCurationListResponse();

        List<HFCuration> curations = curationRepository.findAll();
        for (HFCuration curation : curations) {
            HFCurationResponse hfCurationResponse = new HFCurationResponse();
            BeanUtils.copyProperties(curation, hfCurationResponse);
            hfCurationResponse.submissionID(curation.getId());
            response.addHfCurationResponsesItem(hfCurationResponse);
        }

        return ResponseEntity.ok(response);
    }

    @Override
    public ResponseEntity<HFCurationResponse> hfcPost(@RequestBody HFCurationRequest hfCurationRequest) {
        if (hfCurationRequest != null) {
            HFCuration curation = new HFCuration();
            BeanUtils.copyProperties(hfCurationRequest, curation);
            curation = curationRepository.save(curation);
            HFCurationResponse response = new HFCurationResponse();
            BeanUtils.copyProperties(curation, response);
            response.submissionID(curation.getId());
            return ResponseEntity.ok(response);
        }

        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

}
