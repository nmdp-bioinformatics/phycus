package org.nmdp.hfcus.quality;

import org.nmdp.hfcus.model.HFCuration;
import org.nmdp.hfcus.model.HaplotypeFrequency;
import org.nmdp.hfcus.model.Quality;
import org.springframework.stereotype.Component;

import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

@Component
public class Div50Calculator implements IQualityMetricCalculator {
    @Override
    public boolean calculationNeeded(HFCuration frequency) {
        List<Quality> qualityList = frequency.getHaplotypeFrequencyData().getQualityList();
        if (qualityList == null){
            return true;
        }
        return qualityList
                .stream()
                .noneMatch(quality -> quality.getTypeOfQuality() == io.swagger.model.Quality.TypeOfQualityEnum.DIV_50);
    }

    @Override
    public void calculateMetric(HFCuration curation) {
        List<HaplotypeFrequency> frequencyList = curation.getHaplotypeFrequencyData().getFrequencyList();
        AtomicInteger result = new AtomicInteger();
        AtomicReference<Double> frequencies = new AtomicReference<>((double) 0);
        frequencyList
                .stream()
                .sorted(Comparator.comparing(HaplotypeFrequency::getFrequency).reversed())
                .forEachOrdered(frequency -> {
                    if (frequencies.get() < 0.5){
                        frequencies.updateAndGet(currentValue -> currentValue + frequency.getFrequency());
                        result.getAndIncrement();
                    }
                });
        List<Quality> qualities = curation.getHaplotypeFrequencyData().getQualityList();
        if (qualities == null){
            qualities = new LinkedList<Quality>();
            curation.getHaplotypeFrequencyData().setQualityList(qualities);
        }
        Quality newQuality = new Quality();
        newQuality.setValue(result.doubleValue());
        newQuality.setTypeOfQuality(io.swagger.model.Quality.TypeOfQualityEnum.DIV_50);
        qualities.add(newQuality);
    }
}
