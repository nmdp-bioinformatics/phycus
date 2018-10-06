package org.nmdp.hfcus.quality;

import org.nmdp.hfcus.dao.*;
import org.nmdp.hfcus.model.HFCuration;
import org.nmdp.hfcus.model.HaplotypeFrequency;
import org.nmdp.hfcus.model.Quality;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.LinkedBlockingQueue;

@Service
@EnableAsync
public class QualityService {

    private final LinkedBlockingQueue<HFCuration> queue = new LinkedBlockingQueue<>();
    private static Logger logger = LoggerFactory.getLogger(QualityService.class);
    private List<IQualityMetricCalculator> metricCalculators;
    private HFCurationRepository curationRepository;

    @Autowired
    public QualityService(
            List<IQualityMetricCalculator> metricCalculators,
            HFCurationRepository curationRepository
    ) {
        this.metricCalculators = metricCalculators;
        this.curationRepository = curationRepository;
    }

    @Async
    public void run() throws InterruptedException {
        while (true){
            HFCuration value = queue.take();
            for (IQualityMetricCalculator calculator: metricCalculators){
                if (calculator.calculationNeeded(value)){
                    calculator.calculateMetric(value);
                    curationRepository.save(value);
                }
            }
            Thread.sleep(5000);
        }
    }

    public void addToQueue(HFCuration value) throws InterruptedException {
        queue.put(value);
    }
}
