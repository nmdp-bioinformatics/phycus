package org.nmdp.hfcus.quality;

import org.nmdp.hfcus.dao.HFCurationRepository;
import org.nmdp.hfcus.model.HFCuration;
import org.nmdp.hfcus.model.HaplotypeFrequencySet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class QualityWorker {


    private HFCurationRepository curationRepository;

    @Autowired
    public QualityWorker(
            HFCurationRepository curationRepository
    ) {
        this.curationRepository = curationRepository;
    }

    @Transactional
    void handleSingleMetric(Long nextUp, IQualityMetricCalculator calculator) {
        HFCuration curation = curationRepository.findById(nextUp).orElse(null);
        if (curation != null && calculator.calculationNeeded(curation)) {
            calculator.calculateMetric(curation);
            HaplotypeFrequencySet freqData = curation.getHaplotypeFrequencyData();
            freqData.setNumberOfCalculatedQualities(freqData.getNumberOfCalculatedQualities() + 1);
            curationRepository.save(curation);
        }
    }
}
