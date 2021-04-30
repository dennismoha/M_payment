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
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cards` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `cardCreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userId_idx` (`userId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `users` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` VALUES (2,'USD',5300.00,'melisa','Nairobi','Nairobi','Koinange','00100','Nigeria','melisa@mail.com','http://','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(3,'usd',4000.00,'Ifedayo','billing_address','Lagos','Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','YES','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(4,'usd',0.00,'Ifedayo','billing_address','Lagos','Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','YES','2021-04-29 02:51:48','2021-04-30 02:00:53'),(5,'usd',2700.00,'Ifedayo','billing_address','Lagos','Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(6,'usd',15000.00,'Ifedayo','billing_address','Lagos','Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','YES','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(7,'usd',12160.27,'Ifedayo','billing_address','Lagos','Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','YES','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(8,'usd',0.00,'Ifedayo','billing_address','Lagos','Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','YES','2021-04-29 02:51:48','2021-04-29 11:56:44'),(9,'usd',15000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 04:56:00'),(10,'usd',12300.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 11:58:53'),(11,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(12,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(13,'usd',25000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 14:28:16'),(14,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(15,'usd',3000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 14:28:28'),(16,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(17,'usd',3000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','YES','NO','2021-04-29 02:51:48','2021-04-29 15:56:40'),(18,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 15:20:14'),(19,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(20,'usd',7100.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-30 02:14:29'),(21,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(22,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(23,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 16:41:44'),(24,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(25,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(26,'usd',100.00,'dennis','moha','lagos','lagos','000100','nigeria','melisa@mail.com','none','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(27,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(28,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(29,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(30,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(31,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(32,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(33,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(34,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(35,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(36,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(37,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(38,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(39,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(40,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(41,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(42,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(43,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(44,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(45,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(46,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(47,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(48,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(49,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:51:48','2021-04-29 03:12:29'),(50,'usd',1000.00,'Ifeayo yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:53:47','2021-04-29 03:12:29'),(51,'usd',150000.00,'Ifedayo moyalo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO','2021-04-29 02:55:04','2021-04-29 03:13:39');
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
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
