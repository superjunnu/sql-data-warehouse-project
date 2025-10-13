/*

--------------------------------------------------------------------------
Create database and schemas
--------------------------------------------------------------------------

This script creates a new database after checking if it already exists.
If the database exists, it is dropped and recreated. Additionally, the script
sets up three schemas within the database: bronze, silver and gold.

CAUTION:

Running this script will drop the entire database if it exists! All the data
in the database will be deleted. Ensure you have proper backup before running this script.

*/

USE master;
GO

-- Drop and recreate the database

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

-- Create the database

CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
