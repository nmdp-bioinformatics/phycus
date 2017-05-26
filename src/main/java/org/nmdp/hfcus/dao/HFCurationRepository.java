package org.nmdp.hfcus.dao;

import org.nmdp.hfcus.model.HFCuration;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface HFCurationRepository  extends MongoRepository <HFCuration, String> {
}
