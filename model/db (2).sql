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
-- Table structure for table `cardlogstable`
--

DROP TABLE IF EXISTS `cardlogstable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cardlogstable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `currency` char(6) NOT NULL,
  `amount` decimal(65,2) NOT NULL,
  `billing_name` varchar(45) NOT NULL,
  `freeze` enum('YES','NO') NOT NULL,
  `terminate` enum('YES','NO') NOT NULL,
  `cardId` int NOT NULL,
  `dateChange` varchar(45) NOT NULL,
  `Action` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cardId_idx` (`cardId`),
  CONSTRAINT `cardId` FOREIGN KEY (`cardId`) REFERENCES `cards` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardlogstable`
--

LOCK TABLES `cardlogstable` WRITE;
/*!40000 ALTER TABLE `cardlogstable` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardlogstable` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`id`),
  KEY `userId_idx` (`userId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `users` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` VALUES (2,'USD',300.00,'melisa','Nairobi','Nairobi','Koinange','00100','Nigeria','melisa@mail.com','http://','NO','NO'),(3,'usd',1000.00,'Ifedayo','billing_address','Lagos','Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(4,'usd',1000.00,'Ifedayo','billing_address','Lagos','Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','YES','NO'),(5,'usd',1000.00,'Ifedayo','billing_address','Lagos','Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(6,'usd',1000.00,'Ifedayo','billing_address','Lagos','Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(7,'usd',1000.00,'Ifedayo','billing_address','Lagos','Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(8,'usd',1000.00,'Ifedayo','billing_address','Lagos','Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(9,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(10,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(11,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(12,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(13,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(14,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(15,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(16,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(17,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(18,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(19,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(20,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(21,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(22,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(23,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(24,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(25,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(26,'usd',100.00,'dennis','moha','lagos','lagos','000100','nigeria','melisa@mail.com','none','NO','NO'),(27,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(28,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(29,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(30,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(31,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(32,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(33,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(34,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(35,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(36,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(37,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(38,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(39,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(40,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO'),(41,'usd',1000.00,'sophia yo','billing_address','Abuja','Chinua Achebe','00100','Nigeria','melisa2@mail.com','/virtualcard/virtual-card/','NO','NO');
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (NULL,'melisa2@mail.com','$2b$10$7dN5W41r2NlCBSfN2/7XO.8JHncpQEuJV57j4K/R.id8LqCweLxGO','2018-12-24'),(NULL,'melisa@mail.com','123456','2017-06-15');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'moyalo'
--
/*!50003 DROP PROCEDURE IF EXISTS `addUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addUser`(
  in email VARCHAR(100) ,
  in password VARCHAR(255) ,
  in date DATE 
)
BEGIN
	insert into users(email, password,date) values(email,password, date);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbgetSingleCard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbgetSingleCard`(
	 in userId VARCHAR(100),
     in id int(255)
)
BEGIN
	SELECT * FROM cards where id = id and userId=userId ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllVirtualCards` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllVirtualCards`(	
    in userId varchar(100)
)
BEGIN
	select * from  cards where userId = userId and freeze = 'NO' and terminate = 'NO';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getASingleCard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getASingleCard`(
	 in userIds VARCHAR(100),
     in ids int(255),
     out results varchar(100)    
)
BEGIN	
	SELECT freeze into results  FROM cards WHERE userId = userIds and  id = ids; 	
    if results = 'YES'  THEN		
			signal sqlstate '45000'
			SET message_text = 'card is Freezed';
		else
			 SELECT id, amount,billing_name,billing_address,billing_city,billing_state,billing_postal_code,billing_country,userId,callback_url FROM cards  where id = ids and userId=userIds  ;			
		END IF; 
	 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertcard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertcard`(
  in currency CHAR(10),
  in amount  DECIMAL(65,2) ,
  in billing_name VARCHAR(45) ,
  in billing_address VARCHAR(255),
  in billing_city VARCHAR(45),
  in billing_state VARCHAR(45),
  in billing_postal_code VARCHAR(255),
  in billing_country VARCHAR(225),
  in userId VARCHAR(100) ,
  in callback_url TEXT  
)
BEGIN
	INSERT INTO cards (currency, amount, billing_name, billing_address, billing_city, billing_state, billing_postal_code, billing_country, userId,callback_url)
    values(currency, amount, billing_name, billing_address, billing_city, billing_state, billing_postal_code, billing_country, userId,callback_url);
    select last_insert_id() as last_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-25 11:52:20
