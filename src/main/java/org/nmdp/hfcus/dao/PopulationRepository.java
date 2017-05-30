package org.nmdp.hfcus.dao;

import org.nmdp.hfcus.model.Population;
import org.springframework.data.repository.CrudRepository;

public interface PopulationRepository extends CrudRepository<Population, String> {
}
