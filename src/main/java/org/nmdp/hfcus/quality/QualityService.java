package org.nmdp.hfcus.quality;

import org.nmdp.hfcus.dao.HFCurationRepository;
import org.nmdp.hfcus.model.HFCuration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.stream.Stream;

@Service
@EnableAsync
public class QualityService {

    private static final LinkedBlockingQueue<Long> queue = new LinkedBlockingQueue<>();
    private static Logger logger = LoggerFactory.getLogger(QualityService.class);
    private List<IQualityMetricCalculator> metricCalculators;
    private HFCurationRepository curationRepository;
    private QualityWorker qualityWorker;

    @Autowired
    public QualityService(
            List<IQualityMetricCalculator> metricCalculators,
            HFCurationRepository curationRepository,
            QualityWorker qualityWorker
    ) {
        this.metricCalculators = metricCalculators;
        this.curationRepository = curationRepository;
        this.qualityWorker = qualityWorker;
    }

    @Async
    public void run() throws InterruptedException {
        try (Stream<HFCuration> stream = curationRepository.findAllStreamable()) {
            stream
                    .filter(
                            hfCuration ->
                                    hfCuration.getHaplotypeFrequencyData().getNumberOfCalculatedQualities() < metricCalculators.size()
                    )
                    .forEach(hfCuration -> {
                        try {
                            queue.put(hfCuration.getId());
                        } catch (InterruptedException e) {
                            Thread.currentThread().interrupt();
                        }
                    });
        }
        if (Thread.currentThread().isInterrupted()) {
            throw new InterruptedException();
        }
        while (true) {
            Long nextUp = queue.take();
            for (IQualityMetricCalculator calculator : metricCalculators) {
                qualityWorker.handleSingleMetric(nextUp, calculator);
            }
            Thread.sleep(5000);
        }
    }

    public void addToQueue(HFCuration value) throws InterruptedException {
        queue.put(value.getId());
    }
}
