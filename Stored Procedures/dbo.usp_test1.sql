SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   PROCEDURE [dbo].[usp_test1]
AS
DECLARE @fileName AS NVARCHAR(20) = 'TestDB1_'
SET @fileName += CONVERT(nvarchar(10), getdate(), 105)

-- freeze database to be able to take a storage-based snapshot
ALTER DATABASE SQLServer2022Demo SET SUSPEND_FOR_SNAPSHOT_BACKUP = ON

-- make sure none of the database pages are in memory of the database
DBCC DROPCLEANBUFFERS

-- check if we can read from a frozen database table
SELECT * FROM dbo.t1

-- check if database is actually frozen
SELECT * FROM sys.dm_server_suspend_status

-- create backup with metadata only
BACKUP DATABASE SQLServer2022Demo TO DISK=@fileName WITH METADATA_ONLY

GO
