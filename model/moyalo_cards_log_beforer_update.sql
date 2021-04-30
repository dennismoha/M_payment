-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: moyalo
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `cards_log_beforer_update`
--

DROP TABLE IF EXISTS `cards_log_beforer_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cards_log_beforer_update` (
  `logid` int NOT NULL AUTO_INCREMENT,
  `updateId` int NOT NULL,
  `currency` char(10) NOT NULL DEFAULT 'usd',
  `amount` decimal(65,2) NOT NULL,
  `billing_name` varchar(45) NOT NULL,
  `billing_address` varchar(255) NOT NULL,
  `billing_city` varchar(45) NOT NULL,
  `billing_state` varchar(45) NOT NULL,
  `billing_postal_code` varchar(255) NOT NULL,
  `billing_country` varchar(225) NOT NULL,
  `userId` varchar(100) NOT NULL,
  `callback_url` text NOT NULL,
  `freeze` enum('YES','NO') NOT NULL DEFAULT 'NO',
  `terminate` enum('YES','NO') NOT NULL DEFAULT 'NO',
  `dateBeforeUpdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `actionTaken` varchar(255) NOT NULL,
  `whoMadeChanges` varchar(255) NOT NULL,
  PRIMARY KEY (`logid`),
  KEY `userId_idx` (`userId`),
  KEY `id_idx` (`updateId`),
  CONSTRAINT `id` FOREIGN KEY (`updateId`) REFERENCES `cards` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards_log_beforer_update`
--

LOCK TABLES `cards_log_beforer_update` WRITE;
/*!40000 ALTER TABLE `cards_log_beforer_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `cards_log_beforer_update` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-30  2:15:47
