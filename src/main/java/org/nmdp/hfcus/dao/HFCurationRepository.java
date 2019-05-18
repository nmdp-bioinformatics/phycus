package org.nmdp.hfcus.dao;

import org.nmdp.hfcus.model.HFCuration;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.stream.Stream;

public interface HFCurationRepository  extends CrudRepository<HFCuration, Long> {
    Iterable<HFCuration> findBypopulationDataId(Long populationId);

    @Query("select h from HFCuration h")
    Stream<HFCuration> findAllStreamable();
}
