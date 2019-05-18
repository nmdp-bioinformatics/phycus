ALTER TABLE hfcusdb.haplotype_frequency_set
ADD number_of_calculated_qualities int NOT NULL;

UPDATE hfcusdb.haplotype_frequency_set
SET number_of_calculated_qualities = 0;