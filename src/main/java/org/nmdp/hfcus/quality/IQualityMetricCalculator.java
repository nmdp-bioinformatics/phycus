package org.nmdp.hfcus.quality;

import org.nmdp.hfcus.model.HFCuration;
import org.springframework.stereotype.Component;

@Component
public interface IQualityMetricCalculator {
    boolean calculationNeeded(HFCuration frequency);
    void calculateMetric(HFCuration frequency);
}
