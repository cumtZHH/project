-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Table structure for table `earlywarning`
--

DROP TABLE IF EXISTS `earlywarning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `earlywarning` (
  `ewid` char(10) NOT NULL,
  `ewRecently` date NOT NULL,
  `ewProspective` int(10) NOT NULL,
  `ewPeriod` int(10) NOT NULL,
  `epid` char(10) NOT NULL,
  PRIMARY KEY (`ewid`),
  KEY `fk_earlywarning_equipment1_idx` (`epid`),
  CONSTRAINT `fk_earlywarning_equipment1` FOREIGN KEY (`epid`) REFERENCES `equipment` (`epid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `earlywarning`
--

LOCK TABLES `earlywarning` WRITE;
/*!40000 ALTER TABLE `earlywarning` DISABLE KEYS */;
INSERT INTO `earlywarning` VALUES ('ew00001','2016-09-16',3,30,'ep00004');
/*!40000 ALTER TABLE `earlywarning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment` (
  `epid` char(10) NOT NULL,
  `epName` varchar(100) NOT NULL,
  `etid` char(10) NOT NULL,
  `otid` char(10) NOT NULL,
  PRIMARY KEY (`epid`),
  KEY `fk_equipment_equipmenttype_idx` (`etid`),
  KEY `fk_equipment_overhualtype1_idx` (`otid`),
  CONSTRAINT `fk_equipment_equipmenttype` FOREIGN KEY (`etid`) REFERENCES `equipmenttype` (`etid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipment_overhualtype1` FOREIGN KEY (`otid`) REFERENCES `overhualtype` (`otid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES ('ep00004','CST','et00001','ot00003');
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipmenttype`
--

DROP TABLE IF EXISTS `equipmenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipmenttype` (
  `etid` char(10) NOT NULL,
  `etName` varchar(100) NOT NULL,
  PRIMARY KEY (`etid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipmenttype`
--

LOCK TABLES `equipmenttype` WRITE;
/*!40000 ALTER TABLE `equipmenttype` DISABLE KEYS */;
INSERT INTO `equipmenttype` VALUES ('et00001','CST');
/*!40000 ALTER TABLE `equipmenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintainconsume`
--

DROP TABLE IF EXISTS `maintainconsume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintainconsume` (
  `mcid` char(10) NOT NULL,
  `mcMaterial` varchar(100) NOT NULL,
  `mcNumber` int(10) NOT NULL,
  `mrid` char(10) NOT NULL,
  PRIMARY KEY (`mcid`),
  KEY `fk_maintainconsume_maintainrecord1_idx` (`mrid`),
  CONSTRAINT `fk_maintainconsume_maintainrecord1` FOREIGN KEY (`mrid`) REFERENCES `maintainrecord` (`mrid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintainconsume`
--

LOCK TABLES `maintainconsume` WRITE;
/*!40000 ALTER TABLE `maintainconsume` DISABLE KEYS */;
INSERT INTO `maintainconsume` VALUES ('mc00001','电线',1,'mr00001');
/*!40000 ALTER TABLE `maintainconsume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintaindetails`
--

DROP TABLE IF EXISTS `maintaindetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintaindetails` (
  `mdid` char(10) NOT NULL,
  `mdContents` varchar(500) DEFAULT NULL,
  `mpid` char(10) NOT NULL,
  `mrid` char(10) NOT NULL,
  PRIMARY KEY (`mdid`),
  KEY `fk_maintaindetails_maintainproject1_idx` (`mpid`),
  KEY `fk_maintaindetails_maintainrecord1_idx` (`mrid`),
  CONSTRAINT `fk_maintaindetails_maintainproject1` FOREIGN KEY (`mpid`) REFERENCES `maintainproject` (`mpid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_maintaindetails_maintainrecord1` FOREIGN KEY (`mrid`) REFERENCES `maintainrecord` (`mrid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintaindetails`
--

LOCK TABLES `maintaindetails` WRITE;
/*!40000 ALTER TABLE `maintaindetails` DISABLE KEYS */;
INSERT INTO `maintaindetails` VALUES ('md00001','接线老化','mp00001','mr00001');
/*!40000 ALTER TABLE `maintaindetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintainproject`
--

DROP TABLE IF EXISTS `maintainproject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintainproject` (
  `mpid` char(10) NOT NULL,
  `mpName` varchar(45) NOT NULL,
  `etid` char(10) NOT NULL,
  PRIMARY KEY (`mpid`),
  KEY `fk_maintainproject_equipmenttype1_idx` (`etid`),
  CONSTRAINT `fk_maintainproject_equipmenttype1` FOREIGN KEY (`etid`) REFERENCES `equipmenttype` (`etid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintainproject`
--

LOCK TABLES `maintainproject` WRITE;
/*!40000 ALTER TABLE `maintainproject` DISABLE KEYS */;
INSERT INTO `maintainproject` VALUES ('mp00001','清扫控制箱，紧固接线','et00001');
/*!40000 ALTER TABLE `maintainproject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintainrecord`
--

DROP TABLE IF EXISTS `maintainrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintainrecord` (
  `mrid` char(10) NOT NULL,
  `mrEmployee` varchar(45) NOT NULL,
  `mrTime` date NOT NULL,
  `mrIsnormal` tinyint(1) NOT NULL,
  `epid` char(10) NOT NULL,
  PRIMARY KEY (`mrid`),
  KEY `fk_maintainrecord_equipment1_idx` (`epid`),
  CONSTRAINT `fk_maintainrecord_equipment1` FOREIGN KEY (`epid`) REFERENCES `equipment` (`epid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintainrecord`
--

LOCK TABLES `maintainrecord` WRITE;
/*!40000 ALTER TABLE `maintainrecord` DISABLE KEYS */;
INSERT INTO `maintainrecord` VALUES ('mr00001','某某','2016-08-16',1,'ep00004');
/*!40000 ALTER TABLE `maintainrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overhualtype`
--

DROP TABLE IF EXISTS `overhualtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `overhualtype` (
  `otid` char(10) NOT NULL,
  `otName` varchar(45) NOT NULL,
  `otPeriod` int(10) NOT NULL,
  PRIMARY KEY (`otid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overhualtype`
--

LOCK TABLES `overhualtype` WRITE;
/*!40000 ALTER TABLE `overhualtype` DISABLE KEYS */;
INSERT INTO `overhualtype` VALUES ('ot00001','年检',365),('ot00002','月检',30),('ot00003','周检',7);
/*!40000 ALTER TABLE `overhualtype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-13 21:09:06
