-- MySQL dump 10.13  Distrib 5.6.38, for Linux (x86_64)
--
-- Host: localhost    Database: hfcusdb
-- ------------------------------------------------------
-- Server version	5.6.38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_of_access` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cohort`
--

DROP TABLE IF EXISTS `cohort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cohort` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `genotype_list_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_km5dlx9po75b02v7ol0xm447m` (`genotype_list_id`),
  CONSTRAINT `FK_km5dlx9po75b02v7ol0xm447m` FOREIGN KEY (`genotype_list_id`) REFERENCES `genotype_list` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frequency_error`
--

DROP TABLE IF EXISTS `frequency_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frequency_error` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_of_error` varchar(255) DEFAULT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genotype`
--

DROP TABLE IF EXISTS `genotype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genotype` (
  `genotype_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `genotype_string` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`genotype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genotype_genotyping_methods`
--

DROP TABLE IF EXISTS `genotype_genotyping_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genotype_genotyping_methods` (
  `genotype_genotypeId` bigint(20) NOT NULL,
  `genotyping_methods_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_m25glrw5tfs448wfhgiiif09i` (`genotyping_methods_id`),
  KEY `FK_1xjvvfsjvclh3iijkb5ayla4k` (`genotype_genotypeId`),
  CONSTRAINT `FK_1xjvvfsjvclh3iijkb5ayla4k` FOREIGN KEY (`genotype_genotypeId`) REFERENCES `genotype` (`genotype_id`),
  CONSTRAINT `FK_m25glrw5tfs448wfhgiiif09i` FOREIGN KEY (`genotyping_methods_id`) REFERENCES `genotype_method` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genotype_list`
--

DROP TABLE IF EXISTS `genotype_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genotype_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `license` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genotype_list_genotype_list`
--

DROP TABLE IF EXISTS `genotype_list_genotype_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genotype_list_genotype_list` (
  `genotype_list_id` bigint(20) NOT NULL,
  `genotype_list_genotypeId` bigint(20) NOT NULL,
  UNIQUE KEY `UK_jiyaoh0ktaaap93djr2dqq12s` (`genotype_list_genotypeId`),
  KEY `FK_krwmjp4pb9ap8cucekl008edg` (`genotype_list_id`),
  CONSTRAINT `FK_jiyaoh0ktaaap93djr2dqq12s` FOREIGN KEY (`genotype_list_genotypeId`) REFERENCES `genotype` (`genotype_id`),
  CONSTRAINT `FK_krwmjp4pb9ap8cucekl008edg` FOREIGN KEY (`genotype_list_id`) REFERENCES `genotype_list` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genotype_method`
--

DROP TABLE IF EXISTS `genotype_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genotype_method` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `method_comment` varchar(255) DEFAULT NULL,
  `method_label` int(11) DEFAULT NULL,
  `method_reference` varchar(255) DEFAULT NULL,
  `method_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `haplotype_frequency`
--

DROP TABLE IF EXISTS `haplotype_frequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `haplotype_frequency` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `frequency` double DEFAULT NULL,
  `haplotype_string` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `haplotype_frequency_error_list`
--

DROP TABLE IF EXISTS `haplotype_frequency_error_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `haplotype_frequency_error_list` (
  `haplotype_frequency_id` bigint(20) NOT NULL,
  `error_list_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_ihiqpmnjpqdeitkgaycjt64um` (`error_list_id`),
  KEY `FK_bsxmopj8u7ah1vig1b566e8j` (`haplotype_frequency_id`),
  CONSTRAINT `FK_bsxmopj8u7ah1vig1b566e8j` FOREIGN KEY (`haplotype_frequency_id`) REFERENCES `haplotype_frequency` (`id`),
  CONSTRAINT `FK_ihiqpmnjpqdeitkgaycjt64um` FOREIGN KEY (`error_list_id`) REFERENCES `frequency_error` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `haplotype_frequency_set`
--

DROP TABLE IF EXISTS `haplotype_frequency_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `haplotype_frequency_set` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `license` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `haplotype_frequency_set_frequency_list`
--

DROP TABLE IF EXISTS `haplotype_frequency_set_frequency_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `haplotype_frequency_set_frequency_list` (
  `haplotype_frequency_set_id` bigint(20) NOT NULL,
  `frequency_list_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_sdih46luh72n5mebifkpx0be8` (`frequency_list_id`),
  KEY `FK_h5clr5mvri5h99p8i032fw6y8` (`haplotype_frequency_set_id`),
  CONSTRAINT `FK_h5clr5mvri5h99p8i032fw6y8` FOREIGN KEY (`haplotype_frequency_set_id`) REFERENCES `haplotype_frequency_set` (`id`),
  CONSTRAINT `FK_sdih46luh72n5mebifkpx0be8` FOREIGN KEY (`frequency_list_id`) REFERENCES `haplotype_frequency` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `haplotype_frequency_set_quality_list`
--

DROP TABLE IF EXISTS `haplotype_frequency_set_quality_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `haplotype_frequency_set_quality_list` (
  `haplotype_frequency_set_id` bigint(20) NOT NULL,
  `quality_list_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_a1eyg85jpnr7n2pxlc199l6ox` (`quality_list_id`),
  KEY `FK_r3jjrc9otc0bl600wvhvqofr5` (`haplotype_frequency_set_id`),
  CONSTRAINT `FK_a1eyg85jpnr7n2pxlc199l6ox` FOREIGN KEY (`quality_list_id`) REFERENCES `quality` (`id`),
  CONSTRAINT `FK_r3jjrc9otc0bl600wvhvqofr5` FOREIGN KEY (`haplotype_frequency_set_id`) REFERENCES `haplotype_frequency_set` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `haplotype_frequency_set_resolution_list`
--

DROP TABLE IF EXISTS `haplotype_frequency_set_resolution_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `haplotype_frequency_set_resolution_list` (
  `haplotype_frequency_set_id` bigint(20) NOT NULL,
  `resolution_list_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_j7w0jofiw8eupvd25qpfmeo1v` (`resolution_list_id`),
  KEY `FK_kfr6ahhy5wruvxfliv959bqv0` (`haplotype_frequency_set_id`),
  CONSTRAINT `FK_j7w0jofiw8eupvd25qpfmeo1v` FOREIGN KEY (`resolution_list_id`) REFERENCES `resolution` (`id`),
  CONSTRAINT `FK_kfr6ahhy5wruvxfliv959bqv0` FOREIGN KEY (`haplotype_frequency_set_id`) REFERENCES `haplotype_frequency_set` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hfcuration`
--

DROP TABLE IF EXISTS `hfcuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hfcuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `access_data_id` bigint(20) DEFAULT NULL,
  `cohort_data_id` bigint(20) DEFAULT NULL,
  `haplotype_frequency_data_id` bigint(20) DEFAULT NULL,
  `label_data_id` bigint(20) DEFAULT NULL,
  `method_data_id` bigint(20) DEFAULT NULL,
  `population_data_id` bigint(20) DEFAULT NULL,
  `scope_data_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9jlimklf3bkwxokm0q2pj8kpu` (`access_data_id`),
  KEY `FK_o38qmuh3ggnue4hhtsh488742` (`cohort_data_id`),
  KEY `FK_magkcpru3tc648pwfy178vwwp` (`haplotype_frequency_data_id`),
  KEY `FK_h6b55dk6r8fd6aq6dj3ptebt` (`label_data_id`),
  KEY `FK_engl2apk35n8xnm8c2n86cofi` (`method_data_id`),
  KEY `FK_jw2gci8cigcu5ybw7hqsxjypn` (`population_data_id`),
  KEY `FK_pmtff7qwyr3bexc6nnh6w6yvs` (`scope_data_id`),
  CONSTRAINT `FK_9jlimklf3bkwxokm0q2pj8kpu` FOREIGN KEY (`access_data_id`) REFERENCES `access` (`id`),
  CONSTRAINT `FK_engl2apk35n8xnm8c2n86cofi` FOREIGN KEY (`method_data_id`) REFERENCES `method_set` (`id`),
  CONSTRAINT `FK_h6b55dk6r8fd6aq6dj3ptebt` FOREIGN KEY (`label_data_id`) REFERENCES `label_set` (`id`),
  CONSTRAINT `FK_jw2gci8cigcu5ybw7hqsxjypn` FOREIGN KEY (`population_data_id`) REFERENCES `population` (`id`),
  CONSTRAINT `FK_magkcpru3tc648pwfy178vwwp` FOREIGN KEY (`haplotype_frequency_data_id`) REFERENCES `haplotype_frequency_set` (`id`),
  CONSTRAINT `FK_o38qmuh3ggnue4hhtsh488742` FOREIGN KEY (`cohort_data_id`) REFERENCES `cohort` (`id`),
  CONSTRAINT `FK_pmtff7qwyr3bexc6nnh6w6yvs` FOREIGN KEY (`scope_data_id`) REFERENCES `scope_list` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `label`
--

DROP TABLE IF EXISTS `label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_of_label` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `label_set`
--

DROP TABLE IF EXISTS `label_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label_set` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `label_set_label_list`
--

DROP TABLE IF EXISTS `label_set_label_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label_set_label_list` (
  `label_set_id` bigint(20) NOT NULL,
  `label_list_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_4821evjjv93o1ot79q8q88hdw` (`label_list_id`),
  KEY `FK_g09vyl2jdyce35ih79ioon77o` (`label_set_id`),
  CONSTRAINT `FK_4821evjjv93o1ot79q8q88hdw` FOREIGN KEY (`label_list_id`) REFERENCES `label` (`id`),
  CONSTRAINT `FK_g09vyl2jdyce35ih79ioon77o` FOREIGN KEY (`label_set_id`) REFERENCES `label_set` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `method`
--

DROP TABLE IF EXISTS `method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `method` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `method_comment` varchar(255) DEFAULT NULL,
  `method_reference` varchar(255) DEFAULT NULL,
  `method_value` varchar(255) DEFAULT NULL,
  `type_of_method` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `method_set`
--

DROP TABLE IF EXISTS `method_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `method_set` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `method_set_method_list`
--

DROP TABLE IF EXISTS `method_set_method_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `method_set_method_list` (
  `method_set_id` bigint(20) NOT NULL,
  `method_list_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_cdxbwx6bhcmubw3fjs8rg0kac` (`method_list_id`),
  KEY `FK_m12cqv5a2gxe28csgqy5tak85` (`method_set_id`),
  CONSTRAINT `FK_cdxbwx6bhcmubw3fjs8rg0kac` FOREIGN KEY (`method_list_id`) REFERENCES `method` (`id`),
  CONSTRAINT `FK_m12cqv5a2gxe28csgqy5tak85` FOREIGN KEY (`method_set_id`) REFERENCES `method_set` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `population`
--

DROP TABLE IF EXISTS `population`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `population` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quality`
--

DROP TABLE IF EXISTS `quality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_of_quality` int(11) DEFAULT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resolution`
--

DROP TABLE IF EXISTS `resolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resolution` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resolution` int(11) DEFAULT NULL,
  `scope_element` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scope`
--

DROP TABLE IF EXISTS `scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scope` (
  `scope_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `free_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type_of_scope` int(11) DEFAULT NULL,
  PRIMARY KEY (`scope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scope_list`
--

DROP TABLE IF EXISTS `scope_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scope_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scope_list_scope_list`
--

DROP TABLE IF EXISTS `scope_list_scope_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scope_list_scope_list` (
  `scope_list_id` bigint(20) NOT NULL,
  `scope_list_scopeId` bigint(20) NOT NULL,
  UNIQUE KEY `UK_ihfsqr2fspyy1552dohck4h2` (`scope_list_scopeId`),
  KEY `FK_csfkyn6pahflur9wffelb7ftc` (`scope_list_id`),
  CONSTRAINT `FK_csfkyn6pahflur9wffelb7ftc` FOREIGN KEY (`scope_list_id`) REFERENCES `scope_list` (`id`),
  CONSTRAINT `FK_ihfsqr2fspyy1552dohck4h2` FOREIGN KEY (`scope_list_scopeId`) REFERENCES `scope` (`scope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-10  2:31:51
