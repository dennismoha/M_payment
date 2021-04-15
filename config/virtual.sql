CREATE TABLE createCard(currency varchar(200), amount int(20), billing_name varchar(225),billing_address varchar(225),billing_city varchar(225),billing_state varchar(225),billing_code varchar(225),billing_country varchar(225) ) ;
CREATE TABLE users (id int(26) PRIMARY KEY AUTO_INCREMENT,email varchar(255) unique,password varchar(255)) ;
CREATE TABLE card (id int(26) PRIMARY KEY AUTO_INCREMENT, currency varchar(255) DEFAULT 'usd', amount int(255) Not Null, billing_name varchar(255) Not Null,billing_address varchar(255) Not Null, billing_city varchar(255) Not Null, billing_estate varchar(255) Not Null, billing_postal_code varchar(255) Not Null, billing_country varchar(255) DEFAULT 'US' Not Null ) ;
ALTER TABLE card add FOREIGN KEY (userId) REFERENCES users(email) 
UPDATE card SET amount = if(amount > 1000 , amount - 1000 ,amount) where id = 67 and userId = "test@mail.com" 
UPDATE  card SET amount = if(amount > 1000 , amount - 1000 ,amount) where id = 67 and userId = "test@mail.com" and delete_card <> 'False' OR status_action <> "unblocked"
UPDATE  card SET amount = if(amount > 1000 , amount - 1000 ,amount) where id = 67 and userId = "test@mail.com" and delete_card <> 'False' OR status_action <> "unblocked"
UPDATE card  SET amount = CASE
	WHEN amount > 1000 THEN amount - 1000 
    else "amount is small" 
    END
 WHERE id =67 AND userId = 'test@mail.com'