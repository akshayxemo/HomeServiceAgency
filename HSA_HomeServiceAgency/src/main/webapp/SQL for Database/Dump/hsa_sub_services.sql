-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: hsa
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sub_services`
--

DROP TABLE IF EXISTS `sub_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_services` (
  `Sid` int NOT NULL AUTO_INCREMENT,
  `Cid` int DEFAULT NULL,
  `S_name` varchar(50) DEFAULT NULL,
  `Price` int DEFAULT NULL,
  PRIMARY KEY (`Sid`),
  KEY `Cid` (`Cid`),
  CONSTRAINT `sub_services_ibfk_1` FOREIGN KEY (`Cid`) REFERENCES `service_catagory` (`Cid`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_services`
--

LOCK TABLES `sub_services` WRITE;
/*!40000 ALTER TABLE `sub_services` DISABLE KEYS */;
INSERT INTO `sub_services` VALUES (1,1,'Braiding',300),(2,1,'Nail',500),(3,1,'Spa',1200),(4,1,'Straightening & Smoothing',3000),(5,1,'Makeup Application',7000),(6,2,'Hair',200),(7,2,'Beard Style',150),(8,2,'Spa',800),(9,2,'Facial',700),(10,3,'Cognitive Behavioural Therapy',2000),(11,3,'Mindfulness Therapy',1500),(12,3,'Trauma Therapy',2500),(13,4,'Psychodynamic Therapy',1000),(14,4,'Humanistic Therapy',1500),(15,4,'Behaviour Therapy',850),(16,5,'Rough',600),(17,5,'Joister',250),(18,5,'Trim',500),(19,5,'Cabinet',900),(20,5,'Roofer',750),(21,6,'Commercial',500),(22,6,'Service and Repair',350),(23,6,'Residential',400),(24,6,'Sanitary',250),(25,6,'water Supply',300),(26,7,'Electrical Wiring Services',400),(27,7,'Cable Laying Service',250),(28,7,'Light Fitting Service',200),(29,7,'Electrical Control Panel Service',500),(30,7,'Transmission Lines',550),(31,8,'Replenish Refrigerant',500),(32,8,'Replace Capacitors',400),(33,8,'Clean The Coils',600),(34,8,'Replace or Fix Compressor',440),(35,8,'Replace or Condenser Fan',300),(36,9,'Domestic Cleaning',2000),(37,9,'Commercial Cleaning',1500),(38,9,'Party Cleaning',3000),(39,9,'Tenancy Cleaning',1800),(40,10,'Oil Paint',500),(41,10,'Emulsion Paint',350),(42,10,'Enamel Paint',480),(43,10,'Bituminous Paint',450),(44,10,'Aluminium Paint',300);
/*!40000 ALTER TABLE `sub_services` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-01 20:44:20
