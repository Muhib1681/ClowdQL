-- Step-1  Create a database master key in the master database. 

USE master ;  
GO  
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'stR0ngPassw0rd1';  
GO  

-- Step-2  Create a certificate in the master database

CREATE CERTIFICATE TDE_Certificate   
WITH SUBJECT = 'Certificate to protect DEK'  
GO  


-- Step-3  Switch To AdventureWorks which is the database we want to encrypt 

Use AdventureWorks;
GO  

-- Step-4  Create a database encryption key (DEK), that is protected by the server certificate in the master database.

CREATE DATABASE ENCRYPTION KEY  
WITH ALGORITHM = AES_256
ENCRYPTION BY SERVER CERTIFICATE TDE_Certificate;  
GO  

-- Step-5  Alter the new database to encrypt the database using TDE.  

ALTER DATABASE AdventureWorks  
SET ENCRYPTION ON;  
GO


----------------------- back up the database and restore it on another server -------------------------

-- Create a backup of TDE_Certificate and its private key.  

USE master ;  
GO  

BACKUP CERTIFICATE TDE_Certificate   
TO FILE = 'D:\SQL_Server\BackUps\Certificate\BackUpTDECert'  
WITH PRIVATE KEY   
(  
    FILE = 'D:\SQL_Server\BackUps\Certificate\BackUpPrivateKey',  
    ENCRYPTION BY PASSWORD = 'mOreStr0ngPa$$w0rd' -- remember this password
);  
GO  


---- Backup the Database ----

BACKUP DATABASE [AdventureWorks] 
TO  DISK = N'D:\SQL_Server\BackUps\AdventureWorks.bak' 
WITH NOFORMAT, NOINIT,  NAME = N'AdventureWorks-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
