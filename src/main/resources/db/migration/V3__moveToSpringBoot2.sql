ALTER TABLE `genotype_genotyping_methods`
DROP FOREIGN KEY `FK_1xjvvfsjvclh3iijkb5ayla4k`;
ALTER TABLE `genotype_genotyping_methods`
DROP KEY `FK_1xjvvfsjvclh3iijkb5ayla4k`;
ALTER TABLE `genotype_genotyping_methods`
CHANGE COLUMN `genotype_genotypeId` `genotype_genotype_id` bigint(20);
ALTER TABLE `genotype_genotyping_methods`
ADD KEY `FK_1xjvvfsjvclh3iijkb5ayla4k` (`genotype_genotype_id`);
ALTER TABLE `genotype_genotyping_methods`
ADD CONSTRAINT `FK_1xjvvfsjvclh3iijkb5ayla4k` FOREIGN KEY (`genotype_genotype_id`) REFERENCES `genotype` (`genotype_id`);

ALTER TABLE `genotype_list_genotype_list`
DROP FOREIGN KEY `FK_jiyaoh0ktaaap93djr2dqq12s`;
ALTER TABLE `genotype_list_genotype_list`
DROP KEY `UK_jiyaoh0ktaaap93djr2dqq12s`;
ALTER TABLE `genotype_list_genotype_list`
CHANGE COLUMN `genotype_list_genotypeId` `genotype_list_genotype_id` bigint(20);
ALTER TABLE `genotype_list_genotype_list`
ADD  UNIQUE KEY `UK_jiyaoh0ktaaap93djr2dqq12s` (`genotype_list_genotype_id`);
ALTER TABLE `genotype_list_genotype_list`
ADD CONSTRAINT `FK_jiyaoh0ktaaap93djr2dqq12s` FOREIGN KEY (`genotype_list_genotype_id`) REFERENCES `genotype` (`genotype_id`);

ALTER TABLE `scope_list_scope_list`
DROP FOREIGN KEY `FK_ihfsqr2fspyy1552dohck4h2`;
ALTER TABLE `scope_list_scope_list`
DROP KEY `UK_ihfsqr2fspyy1552dohck4h2`;
ALTER TABLE `scope_list_scope_list`
CHANGE COLUMN `scope_list_scopeId` `scope_list_scope_id` bigint(20);
ALTER TABLE `scope_list_scope_list`
ADD  UNIQUE KEY `UK_ihfsqr2fspyy1552dohck4h2` (`scope_list_scope_id`);
ALTER TABLE `scope_list_scope_list`
ADD CONSTRAINT `FK_ihfsqr2fspyy1552dohck4h2` FOREIGN KEY (`scope_list_scope_id`) REFERENCES `scope` (`scope_id`);

CREATE TABLE `hibernate_sequence` (
 `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;