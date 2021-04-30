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
-- Dumping events for database 'moyalo'
--

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
  in role varchar(20)
)
BEGIN
	insert into users(email, password,role) values(email,password,role);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cardsLogAfterUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cardsLogAfterUpdate`(
	in cardId int,
    in userId varchar(100),
    in amount decimal,    
    in currency varchar(25),  
	in freeze CHAR(3) ,
    in terminate CHAR(3),   
	in actionTaken varchar(100),
    in whoMadeChanges varchar(100),    
    out success varchar(200) 
)
BEGIN    
    DECLARE message VARCHAR(200);       
    
    SET success = 'success';	
	insert INTO cards_log_after_update(currency,amount,userId,freeze,terminate,actionTaken,whoMadeChanges,cardId) values (currency, amount, userId, freeze, terminate, actionTaken, whoMadeChanges, cardId );
	SELECT success;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `freezeVirtualCard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `freezeVirtualCard`(
	in userEmailIds varchar(100),
    in positionId int  ,
    out freezeStatus_ varchar(5),
    out amounts decimal,
    out currencys varchar(5)
   
)
BEGIN
	DECLARE terminateStatus VARCHAR(5);
	DECLARE freezeStatus VARCHAR(5);
    DECLARE message VARCHAR(200);
    
	select freeze, terminate into freezeStatus ,terminateStatus from cards WHERE userId = TRIM(userEmailIds) and Id = TRIM(positionId);	
   
        if terminateStatus  = 'YES' THEN
			SET message = 'OPERATION NOT ALLOWED';
				signal sqlstate '45000'
						SET message_text = message;      
		ELSEIF freezeStatus <> TRIM('YES') THEN
			UPDATE cards set freeze = TRIM('YES') WHERE userId = userEmailIds and Id = positionId;
			SELECT freeze,amount, currency into freezeStatus_ ,amounts,currencys  from cards WHERE userId = userEmailIds and Id = positionId;
            select freezeStatus_, amounts,currencys ;
        ELSEIF freezeStatus <> TRIM('NO') THEN
			UPDATE cards set freeze = 'NO' WHERE userId = userEmailIds and Id = positionId;
			SELECT freeze, amount, currency INTO freezeStatus_,amounts,currencys  FROM cards  WHERE userId = userEmailIds and Id = positionId;	
			select freezeStatus_, amounts, currencys;
	END IF;  
   
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fundVirtualCard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `fundVirtualCard`(
	in ids int ,
	in userIds varchar(100),
    in fundAmount decimal,
    out initialAmount decimal,
    out balanceAmount decimal    
)
BEGIN
	DECLARE currentAmount decimal(65,2);
    DECLARE updatedAmount decimal(65,2);
     DECLARE terminateStatus varchar(200);
	DECLARE freeezeStatus varchar(200);
    DECLARE message  VARCHAR(200);
    
    SELECT 
    amount , freeze , terminate
INTO currentAmount , freeezeStatus ,terminateStatus  FROM
    cards
WHERE
    id = ids AND userId = userIds;
 
IF terminateStatus <> 'NO' OR  freeezeStatus <> 'NO' THEN
		SET message = 'NOT AUTHORIZED';
		signal sqlstate '45000'
				SET message_text = message;
ELSE 
	select amount into currentAmount  from cards WHERE userId = userIds  and id = ids;
	update cards set amount = amount + fundAmount WHERE userId = userIds  and id = ids;
    select amount into updatedAmount  from cards WHERE userId = userIds  and id = ids;
    set initialAmount :=currentAmount;
    set balanceAmount :=  updatedAmount;    
    select initialAmount, balanceAmount;

end if; 
    end ;;
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
    in userIds varchar(100)
)
BEGIN
SELECT id, amount,billing_name,billing_address,billing_city,billing_state,billing_postal_code,billing_country,userId,callback_url FROM cards  where userId = userIds  and freeze <> 'YES' and terminate <> 'YES'  ;			
	
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
/*!50003 DROP PROCEDURE IF EXISTS `terminateVirtualCard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `terminateVirtualCard`(
	in userEmailIds varchar(100),
    in positionId int  ,
    out terminateStatus varchar(5),
    OUT currencys varchar(5),
    OUT freezes VARCHAR(5),
    OUT amounts DECIMAL(5,2)
)
BEGIN
	DECLARE amountInCard DECIMAL;
    DECLARE message VARCHAR(200);
    
    select amount into amountInCard from cards WHERE userId = userEmailIds and Id = positionId;
    
    if amountInCard != 0 THEN
		SET message = CONCAT('PLEASE TRANSFER THE FUNDS IN TH CARD',amountInCard);
		signal sqlstate '45000'
				SET message_text = message;
	else
		UPDATE cards set terminate = 'YES' WHERE userId = userEmailIds and Id = positionId;
        select terminate,amount, currency , freeze into terminateStatus,amounts, currencys, freezes FROM cards WHERE userId = userEmailIds and Id = positionId;
        SELECT terminateStatus,amounts,currencys, freezes ;
	END IF;
		

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `withDrawFromCard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `withDrawFromCard`(
	in WithDrawalAmount DECIMAL(65,2),
	in positionId INT(11), 
	in userIds VARCHAR(100),
    out currentAccountBalance DECIMAL(65,2) ,
    out currencys varchar(5)
)
BEGIN
	DECLARE amountInAccount DECIMAL(65,7); -- current balance in account
     DECLARE terminateStatus varchar(200);
	DECLARE freeezeStatus varchar(200);
    DECLARE message  VARCHAR(200);
    
    
SELECT 
    amount , freeze , terminate
INTO amountInAccount, freeezeStatus ,terminateStatus  FROM
    cards
WHERE
    id = positionId AND userId = userIds;

 
IF terminateStatus <> 'NO' OR  freeezeStatus <> 'NO' THEN
		SET message = 'NOT AUTHORIZED';
		signal sqlstate '45000'
				SET message_text = message;
ELSEIF WithDrawalAmount > amountInAccount OR  WithDrawalAmount < 0 THEN
	SET message = CONCAT('PLEASE TOP UP TO WITHDRAW ',amountInAccount);
	SIGNAL
		sqlstate '45000' set message_TEXT = message;
ELSE 
	UPDATE  cards SET amount =  amount - WithDrawalAmount  where id = positionId and userId = userIds;
	SELECT     amount,currency INTO currentAccountBalance, currencys FROM     cards WHERE     id = positionId AND userId = userIds; 
    SELECT currentAccountBalance ,currencys;
end if;

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

-- Dump completed on 2021-04-30  2:15:48
