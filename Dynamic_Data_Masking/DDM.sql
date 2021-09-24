CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[PreferredName] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](256) MASKED WITH (FUNCTION = 'email()') NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[FaxNumber] [nvarchar](20) NULL,
	[HireDate] [datetime] NULL,
	[Salary] [bigint] MASKED WITH (FUNCTION = 'default()') NULL,
	[IsSystemUser] [bit] NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[HashedPassword] [varbinary](max) NULL
) ON [PRIMARY] 
GO


/* inserting a few rows in our newly created employee table */
INSERT [dbo].[Employee] ([EmployeeID], [FullName], [PreferredName], [EmailAddress], [PhoneNumber], [FaxNumber], [HireDate], [Salary], [IsSystemUser], [UserName], [HashedPassword]) VALUES (9, N'Alica Fatnowna', N'Alica', N'alicaf@wideworldimporters.com', N'(415) 555-0102', N'(415) 555-0103', N'2007-12-07T00:00:00', 30000, 1, N'alicaf', 0x7DFAB08E9AC574C5B15CF19D18E5B3EB466EAC7392F4295815B08221E78EA790)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FullName], [PreferredName], [EmailAddress], [PhoneNumber], [FaxNumber], [HireDate], [Salary], [IsSystemUser], [UserName], [HashedPassword]) VALUES (7, N'Amy Trefl', N'Amy', N'amyt@wideworldimporters.com', N'(415) 555-0198', N'(415) 555-0103', N'2009-02-15T00:00:00', 48000, 1, N'amyt', 0x7A92BBEA830C5ED027DCC1D710130EED9EA50FB3E6D5F793DDEFC4B50215033F)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FullName], [PreferredName], [EmailAddress], [PhoneNumber], [FaxNumber], [HireDate], [Salary], [IsSystemUser], [UserName], [HashedPassword]) VALUES (8, N'Anthony Grosse', N'Anthony', N'anthonyg@wideworldimporters.com', N'(415) 555-0121', N'(415) 555-0103', N'2010-07-23T00:00:00', 81000, 1, N'anthonyg', 0x2FD8B838A3C77778C990F464073AA23C0EEE019763ED6A99C77457E8691819DE)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FullName], [PreferredName], [EmailAddress], [PhoneNumber], [FaxNumber], [HireDate], [Salary], [IsSystemUser], [UserName], [HashedPassword]) VALUES (16, N'Archer Lamble', N'Archer', N'archerl@wideworldimporters.com', N'(415) 555-0164', N'(415) 555-0103', N'2009-05-13T00:00:00', 84000, 1, N'archerl', 0x06187F68631295411B022C48B07338F20F4C5C73B31DB67C056C0AE07B8F6EF6)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FullName], [PreferredName], [EmailAddress], [PhoneNumber], [FaxNumber], [HireDate], [Salary], [IsSystemUser], [UserName], [HashedPassword]) VALUES (11, N'Ethan Onslow', N'Ethan', N'ethano@wideworldimporters.com', N'(415) 555-0179', N'(415) 555-0103', N'2011-12-17T00:00:00', 30000, 1, N'ethano', 0xD70F37F5C019499959DDF987E5343B957FEB58959A0270E06919D47F2E84D409)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FullName], [PreferredName], [EmailAddress], [PhoneNumber], [FaxNumber], [HireDate], [Salary], [IsSystemUser], [UserName], [HashedPassword]) VALUES (5, N'Eva Muirden', N'Eva', N'evam@wideworldimporters.com', N'(415) 555-0114', N'(415) 555-0103', N'2012-01-22T00:00:00', 108000, 1, N'evam', 0xE682D36E43B6A3940ED6428B2DE3CEEDD1763C5E0EC02FFBDC35671F9B3E5F3A)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FullName], [PreferredName], [EmailAddress], [PhoneNumber], [FaxNumber], [HireDate], [Salary], [IsSystemUser], [UserName], [HashedPassword]) VALUES (12, N'Henry Forlonge', N'Henry', N'henryf@wideworldimporters.com', N'(415) 555-0125', N'(415) 555-0103', N'2009-03-18T00:00:00', 63000, 1, N'henryf', 0x3F74BAD95BD9059EFCF80F983899E24369959FD488113AA2D7616823A91659CF)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FullName], [PreferredName], [EmailAddress], [PhoneNumber], [FaxNumber], [HireDate], [Salary], [IsSystemUser], [UserName], [HashedPassword]) VALUES (13, N'Hudson Hollinworth', N'Hudson', N'hudsonh@wideworldimporters.com', N'(415) 555-0198', N'(415) 555-0103', N'2010-11-27T00:00:00', 96000, 1, N'hudsonh', 0x4AC0A24180C54F425AC88CA33B62136A37B6AAA1943BEA14FC34E228ECCC35C4)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FullName], [PreferredName], [EmailAddress], [PhoneNumber], [FaxNumber], [HireDate], [Salary], [IsSystemUser], [UserName], [HashedPassword]) VALUES (3, N'Hudson Onslow', N'Hudson', N'hudsono@wideworldimporters.com', N'(415) 555-0163', N'(415) 555-0103', N'2012-03-05T00:00:00', 108000, 1, N'hudsono', 0x23668CCC579015EA934736C3D7B87E86360EB5EEE164C4368A7B103C11E3436E)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FullName], [PreferredName], [EmailAddress], [PhoneNumber], [FaxNumber], [HireDate], [Salary], [IsSystemUser], [UserName], [HashedPassword]) VALUES (4, N'Isabella Rupp', N'Isabella', N'isabellar@wideworldimporters.com', N'(415) 555-0104', N'(415) 555-0103', N'2010-08-24T00:00:00', 150000, 1, N'isabellar', 0xB45E7C4E37C32FA9A5A3161B9DB1C9C1E787BB7DB424E7FD7A20895D4BFB5D31)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FullName], [PreferredName], [EmailAddress], [PhoneNumber], [FaxNumber], [HireDate], [Salary], [IsSystemUser], [UserName], [HashedPassword]) VALUES (20, N'Jack Potter', N'Jack', N'jackp@wideworldimporters.com', N'(415) 555-0187', N'(415) 555-0103', N'2009-05-29T00:00:00', 33000, 1, N'jackp', 0x8024E8041C1F5BD98FE46983F98C2F5E53E2CD75BF4A6EF6AC13A299F10F714A)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FullName], [PreferredName], [EmailAddress], [PhoneNumber], [FaxNumber], [HireDate], [Salary], [IsSystemUser], [UserName], [HashedPassword]) VALUES (19, N'Jai Shand', N'Jai', N'jais@wideworldimporters.com', N'(415) 555-0176', N'(415) 555-0103', N'2011-11-13T00:00:00', 360000, 1, N'jais', 0x84901D360414CD9127E1B83A9F9E7C6B940AA8BD888699388C9FA465DBD297DA)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FullName], [PreferredName], [EmailAddress], [PhoneNumber], [FaxNumber], [HireDate], [Salary], [IsSystemUser], [UserName], [HashedPassword]) VALUES (18, N'Katie Darwin', N'Katie', N'katied@wideworldimporters.com', N'(415) 555-0169', N'(415) 555-0103', N'2008-07-12T00:00:00', 351000, 1, N'katied', 0x47AD2C4A1C611756FB164DE988C259E7E516DD48AF9C3421DD0FE95B3F1E3F2B)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FullName], [PreferredName], [EmailAddress], [PhoneNumber], [FaxNumber], [HireDate], [Salary], [IsSystemUser], [UserName], [HashedPassword]) VALUES (2, N'Kayla Woodcock', N'Kayla', N'kaylaw@wideworldimporters.com', N'(415) 555-0124', N'(415) 555-0103', N'2008-04-19T00:00:00', 126000, 1, N'kaylaw', 0x616E9B558976525E7F14D780EBAE80C68586958DC97C506DB418E2E2C49E340E)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FullName], [PreferredName], [EmailAddress], [PhoneNumber], [FaxNumber], [HireDate], [Salary], [IsSystemUser], [UserName], [HashedPassword]) VALUES (14, N'Lily Code', N'Lily', N'lilyc@wideworldimporters.com', N'(415) 555-0183', N'(415) 555-0103', N'2010-06-06T00:00:00', 225000, 1, N'lilyc', 0xD00658893B3F96277088B3C71DCFBF4DF6E3947EEDBF0C8DA285EFD5C7D4BADD)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FullName], [PreferredName], [EmailAddress], [PhoneNumber], [FaxNumber], [HireDate], [Salary], [IsSystemUser], [UserName], [HashedPassword]) VALUES (17, N'Piper Koch', N'Piper', N'piperk@wideworldimporters.com', N'(415) 555-0167', N'(415) 555-0103', N'2011-10-15T00:00:00', 384000, 1, N'piperk', 0x61D8D0828E55E8895E216B88FE98CBA6B5940992279D74992AAA2563F4E66715)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FullName], [PreferredName], [EmailAddress], [PhoneNumber], [FaxNumber], [HireDate], [Salary], [IsSystemUser], [UserName], [HashedPassword]) VALUES (6, N'Sophia Hinton', N'Sophia', N'sophiah@wideworldimporters.com', N'(415) 555-0119', N'(415) 555-0103', N'2007-05-14T00:00:00', 357000, 1, N'sophiah', 0x451BB10A515F06331540DB392031F9D9BC4EF536A1F86D1CA6C7394556BAA3C0)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FullName], [PreferredName], [EmailAddress], [PhoneNumber], [FaxNumber], [HireDate], [Salary], [IsSystemUser], [UserName], [HashedPassword]) VALUES (10, N'Stella Rosenhain', N'Stella', N'stellar@wideworldimporters.com', N'(415) 555-0111', N'(415) 555-0103', N'2007-11-17T00:00:00', 54000, 1, N'stellar', 0x1BA4B55887E2BDCB06087A20E1CC608ADDCA538BABEC0441D2D6704DCAFE2EA4)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FullName], [PreferredName], [EmailAddress], [PhoneNumber], [FaxNumber], [HireDate], [Salary], [IsSystemUser], [UserName], [HashedPassword]) VALUES (15, N'Taj Shand', N'Taj', N'tajs@wideworldimporters.com', N'(415) 555-0102', N'(415) 555-0151', N'2009-03-14T00:00:00', 342000, 1, N'tajs', 0x9AEFEEC0DBB0EA6B25F0EB99C62C724F18428D45799DCD8A7B63B859B0F8FCB4)
GO


/* lets check our masked columns */
SELECT * FROM dbo.Employee

/* lets check our masked columns for a user that does not have unmask permission */
EXECUTE AS USER = 'testuser';  

SELECT * FROM Employee

REVERT;


/* Add one more masking rule. this is the custom masking rule */
ALTER TABLE dbo.Employee
ALTER COLUMN PhoneNumber ADD MASKED WITH (FUNCTION = 'partial(6,"xxxxxx",2)'); 
GO

/* lets check our employee table again */
SELECT * FROM dbo.Employee

/* lets check our masked columns for a user that do not have unmask permission */
EXECUTE AS USER = 'testuser';  

SELECT * FROM Employee

REVERT;

/* information about the masked columns */
select * from sys.masked_columns

-- OR

SELECT c.name, tbl.name as table_name, c.is_masked, c.masking_function  
FROM sys.masked_columns AS c  
JOIN sys.tables AS tbl   
    ON c.[object_id] = tbl.[object_id]  
WHERE is_masked = 1; 


/* Lets give UNMASK permission to the testuser */

GRANT UNMASK TO testuser;  

EXECUTE AS USER = 'testuser';  

SELECT * FROM dbo.Employee;  

REVERT;    
  
-- Removing the UNMASK permission  

REVOKE UNMASK TO testuser;


-- Dropping masking from column --

ALTER TABLE dbo.Employee
ALTER COLUMN PhoneNumber DROP MASKED;
