SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


--create stored procedure

CREATE   PROCEDURE [dbo].[usp_initializeDB]

AS

-- drop database with tables if exists
DROP TABLE IF EXISTS t1

-- create table with 1 column
CREATE TABLE t1 (c1 int)

-- insert 3 rows into table
INSERT INTO t1 VALUES (1)
INSERT INTO t1 VALUES (2)
INSERT INTO t1 VALUES (3)

GO
