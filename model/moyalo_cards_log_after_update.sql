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
-- Table structure for table `cards_log_after_update`
--

DROP TABLE IF EXISTS `cards_log_after_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cards_log_after_update` (
  `id` int NOT NULL AUTO_INCREMENT,
  `currency` char(10) NOT NULL DEFAULT 'usd',
  `amount` decimal(65,2) NOT NULL,
  `userId` varchar(100) NOT NULL,
  `freeze` enum('YES','NO') NOT NULL DEFAULT 'NO',
  `terminate` enum('YES','NO') NOT NULL DEFAULT 'NO',
  `dateAfterUpdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `actionTaken` varchar(255) NOT NULL,
  `whoMadeChanges` varchar(255) NOT NULL,
  `cardId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId_idx` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards_log_after_update`
--

LOCK TABLES `cards_log_after_update` WRITE;
/*!40000 ALTER TABLE `cards_log_after_update` DISABLE KEYS */;
INSERT INTO `cards_log_after_update` VALUES (1,'usd',22000.00,'melisa2@mail.com','NO','NO','2021-04-29 14:22:06','amount updated to ,22000.00','melisa2@mail.com + \' \' +user',13),(2,'usd',23000.00,'melisa2@mail.com','NO','NO','2021-04-29 14:22:49','amount updated to ,23000.00','melisa2@mail.com  \' \' user',13),(3,'usd',24000.00,'melisa2@mail.com','NO','NO','2021-04-29 14:23:42','amount updated to ,24000.00','username: melisa2@mail.com  \' role: \' user',13),(4,'usd',25000.00,'melisa2@mail.com','NO','NO','2021-04-29 14:28:16','amount updated to ,25000','username: melisa2@mail.com  \' role: \' user',13),(5,'usd',2000.00,'melisa2@mail.com','NO','NO','2021-04-29 14:28:24','amount updated to ,2000','username: melisa2@mail.com  \' role: \' user',15),(6,'usd',3000.00,'melisa2@mail.com','NO','NO','2021-04-29 14:28:28','amount updated to ,3000','username: melisa2@mail.com  \' role: \' user',15),(7,'usd',2000.00,'melisa2@mail.com','NO','NO','2021-04-29 15:22:38','amount updated to ,2000','username: melisa2@mail.com  \' role: \' user',17),(8,'usd',3000.00,'melisa2@mail.com','NO','NO','2021-04-29 15:24:08','amount updated to ,3000','username: melisa2@mail.com  \' role: \' user',17),(9,'usd',2000.00,'melisa2@mail.com','NO','NO','2021-04-29 15:25:06','amount updated to ,2000','username: melisa2@mail.com  \' role: \' user',20),(10,'usd',7000.00,'melisa2@mail.com','NO','NO','2021-04-29 15:25:44','amount updated to ,7000','username: melisa2@mail.com  \' role: \' user',20),(11,'usd',1000.00,'melisa2@mail.com','NO','NO','2021-04-29 15:49:27','amount updated to ,1000','username: melisa2@mail.com  \' role: \' admin',17),(12,'usd',1000.00,'melisa2@mail.com','NO','NO','2021-04-29 15:49:51','amount updated to ,1000','username: melisa2@mail.com  \' role: \' admin',17),(13,'usd',1000.00,'melisa2@mail.com','NO','NO','2021-04-29 15:53:22','amount updated to ,1000','username: melisa2@mail.com  \' role: \' admin',17),(14,'usd',1000.00,'melisa2@mail.com','YES','NO','2021-04-29 15:56:40','amount updated to ,1000','username: melisa2@mail.com  \' role: \' admin',17),(15,'usd',1000.00,'melisa2@mail.com','YES','NO','2021-04-29 15:57:05','amount updated to ,1000','username: melisa2@mail.com  \' role: \' admin',20),(16,'usd',1000.00,'melisa2@mail.com','NO','NO','2021-04-29 15:57:20','amount updated to ,1000','username: melisa2@mail.com  \' role: \' admin',20),(17,'usd',1000.00,'melisa2@mail.com','YES','NO','2021-04-29 16:06:11','amount updated to ,1000','username: melisa2@mail.com  \' role: \' admin',20),(18,'usd',1000.00,'melisa2@mail.com','NO','NO','2021-04-29 16:10:27','amount updated to ,1000','username: melisa2@mail.com  \' role: \' admin',20),(19,'usd',1000.00,'melisa2@mail.com','YES','NO','2021-04-29 16:12:30','amount updated to ,1000','username: melisa2@mail.com  \' role: \' admin',20),(20,'usd',7000.00,'melisa2@mail.com','NO','NO','2021-04-29 16:13:55','amount updated to ,7000','username: melisa2@mail.com  \' role: \' admin',20),(21,'usd',7000.00,'melisa2@mail.com','YES','NO','2021-04-29 16:14:00','amount updated to ,7000','username: melisa2@mail.com  \' role: \' admin',20),(22,'usd',1000.00,'melisa2@mail.com','YES','NO','2021-04-29 16:15:38','amount updated to ,1000','username: melisa2@mail.com  \' role: \' admin',23),(23,'usd',1000.00,'melisa2@mail.com','NO','NO','2021-04-29 16:19:12','freezed ? ,NO','username: melisa2@mail.com  \' role: \' admin',23),(24,'usd',1000.00,'melisa2@mail.com','YES','NO','2021-04-29 16:19:36','freezed ? ,YES','username: melisa2@mail.com  \' role: \' admin',23),(25,'usd',1000.00,'melisa2@mail.com','NO','NO','2021-04-29 16:24:08','freezed ? ,NO','username: melisa2@mail.com  \' role: \' admin',23),(26,'usd',1000.00,'melisa2@mail.com','YES','NO','2021-04-29 16:26:01','freezed ? ,YES','username: melisa2@mail.com  \' role: \' admin',23),(27,'usd',1000.00,'melisa2@mail.com','NO','NO','2021-04-29 16:27:21','freezed ? ,NO','username: melisa2@mail.com  \' role: \' admin',23),(28,'usd',1000.00,'melisa2@mail.com','NO','NO','2021-04-29 16:27:43','freezed ? ,NO','username: melisa2@mail.com  \' role: \' admin',23),(29,'usd',1000.00,'melisa2@mail.com','NO','NO','2021-04-29 16:28:15','freezed ? ,NO','username: melisa2@mail.com  \' role: \' admin',23),(30,'usd',1000.00,'melisa2@mail.com','NO','NO','2021-04-29 16:41:20','freezed ? ,NO','username: melisa2@mail.com  \' role: \' admin',23),(31,'usd',1000.00,'melisa2@mail.com','YES','NO','2021-04-29 16:41:26','freezed ? ,YES','username: melisa2@mail.com  \' role: \' admin',23),(32,'usd',1000.00,'melisa2@mail.com','NO','NO','2021-04-29 16:41:45','freezed ? ,NO','username: melisa2@mail.com  \' role: \' admin',23),(33,'usd',7000.00,'melisa2@mail.com','NO','NO','2021-04-29 16:54:38','freezed ? ,NO','username: melisa2@mail.com  \' role: \' admin',20),(34,'usd',6700.00,'melisa2@mail.com','NO','NO','2021-04-29 17:07:49','Amount withdrawn:balance ,6700.00','username: melisa2@mail.com  \' role: \' user',20),(35,'usd',6600.00,'melisa2@mail.com','NO','NO','2021-04-29 17:09:10','Amount withdrawn:balance ,6600.00','username: melisa2@mail.com  \' role: \' user',20),(36,'usd',6600.00,'melisa2@mail.com','NO','NO','2021-04-29 17:10:27','Amount withdrawn:balance ,6600.00','username: melisa2@mail.com  \' role: \' user',20),(37,'usd',6700.00,'melisa2@mail.com','NO','NO','2021-04-29 17:10:37','Amount withdrawn:balance ,6700.00','username: melisa2@mail.com  \' role: \' user',20),(38,'usd',6900.00,'melisa2@mail.com','NO','NO','2021-04-29 17:10:48','Amount withdrawn:balance ,6900.00','username: melisa2@mail.com  \' role: \' user',20),(39,'usd',7100.00,'melisa2@mail.com','NO','NO','2021-04-29 17:13:05','Amount withdrawn:balance ,7100.00','username: melisa2@mail.com  \' role: \' user',20),(40,'usd',7300.00,'melisa2@mail.com','NO','NO','2021-04-29 17:13:10','Amount withdrawn:balance ,7300.00','username: melisa2@mail.com  \' role: \' user',20),(41,'usd',107300.00,'melisa2@mail.com','NO','NO','2021-04-29 17:14:20','Amount withdrawn:balance ,107300.00','username: melisa2@mail.com  \' role: \' user',20),(42,'usd',7300.00,'melisa2@mail.com','NO','NO','2021-04-29 17:22:21','Amount withdrawn:balance ,7300.00','username: melisa2@mail.com  \' role: \' user',20),(43,'usd',7200.00,'melisa2@mail.com','NO','NO','2021-04-30 01:22:45','Amount withdrawn:balance ,7200.00','username: melisa2@mail.com  \' role: \' user',20),(44,'usd',7200.00,'melisa2@mail.com','YES','NO','2021-04-30 01:25:44','freezed ? ,YES','username: melisa2@mail.com  \' role: \' admin',20),(45,'usd',7200.00,'melisa2@mail.com','NO','NO','2021-04-30 01:26:33','freezed ? ,NO','username: melisa2@mail.com  \' role: \' admin',20),(46,'usd',7200.00,'melisa2@mail.com','YES','NO','2021-04-30 01:27:06','freezed ? ,YES','username: melisa2@mail.com  \' role: \' admin',20),(47,'usd',7200.00,'melisa2@mail.com','NO','NO','2021-04-30 01:27:37','freezed ? ,NO','username: melisa2@mail.com  \' role: \' admin',20),(48,'usd',7100.00,'melisa2@mail.com','NO','NO','2021-04-30 01:27:42','Amount withdrawn:balance ,7100.00','username: melisa2@mail.com  \' role: \' user',20),(49,'usd',27000.00,'melisa2@mail.com','NO','NO','2021-04-30 01:31:52','Amount withdrawn:balance ,27000.00','username: melisa2@mail.com  \' role: \' user',4),(50,'usd',24300.00,'melisa2@mail.com','NO','NO','2021-04-30 01:32:07','Amount withdrawn:balance ,24300.00','username: melisa2@mail.com  \' role: \' user',4),(51,'usd',100.00,'melisa2@mail.com','NO','NO','2021-04-30 01:32:35','Amount withdrawn:balance ,100.00','username: melisa2@mail.com  \' role: \' user',4),(52,'usd',1.00,'melisa2@mail.com','NO','NO','2021-04-30 01:32:43','Amount withdrawn:balance ,1.00','username: melisa2@mail.com  \' role: \' user',4),(53,'usd',0.00,'melisa2@mail.com','NO','NO','2021-04-30 01:33:11','Amount withdrawn:balance ,0.00','username: melisa2@mail.com  \' role: \' user',4),(54,'usd',0.00,'melisa2@mail.com','NO','YES','2021-04-30 02:00:53','terminated ? ,YES','username: melisa2@mail.com  \' role: \' user',4),(55,'usd',7100.00,'melisa2@mail.com','YES','NO','2021-04-30 02:13:48','freezed ? ,YES','username: melisa2@mail.com  \' role: \' admin',20),(56,'usd',7100.00,'melisa2@mail.com','NO','NO','2021-04-30 02:14:29','freezed ? ,NO','username: melisa2@mail.com  \' role: \' admin',20);
/*!40000 ALTER TABLE `cards_log_after_update` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-30  2:15:48
