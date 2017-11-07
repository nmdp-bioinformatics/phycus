package org.nmdp.hfcus.dao;

import org.nmdp.hfcus.model.HFCuration;
import org.springframework.data.repository.CrudRepository;

public interface HFCurationRepository  extends CrudRepository<HFCuration, Long> {
    Iterable<HFCuration> findBypopulationDataId(Long populationId);
}
