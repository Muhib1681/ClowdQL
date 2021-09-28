-- Move or copy the backup file from the source server to the same location on the destination server.   

-- Move or copy the backup of the server certificate and the private key file from the source server 
-- to the same location on the destination server.   

-- Create a database master key on the destination instance of SQL Server.   
USE master;  
GO  
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'stR0ngPassw0rd2';  
GO  

-- Create the certificate on the destination server by using the original server certificate backup file.   
-- The password must be the same as the password that was used when the backup was created.  

CREATE CERTIFICATE TDE_Certificate   
FROM FILE = 'D:\SQL_Server\BackUps\Certificate\BackUpTDECert'
WITH PRIVATE KEY   
(  
    FILE = 'D:\SQL_Server\BackUps\Certificate\BackUpPrivateKey',  
    DECRYPTION BY PASSWORD = 'mOreStr0ngPa$$w0rd'  
);  
GO 


-- Restore the database to this new server.  


USE [master]
GO
RESTORE DATABASE [AdventureWorks] 
FROM  DISK = N'D:\SQL_Server\BackUps\AdventureWorks.bak' 
WITH  FILE = 1,  NOUNLOAD,  STATS = 5

GO
