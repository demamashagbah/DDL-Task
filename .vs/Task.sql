-- 2. create user table 
CREATE TABLE [dbo].[Users] (
	[UserID] INT IDENTITY(1,1) PRIMARY KEY,
	[Username] NVARCHAR(50) NOT NULL,
);