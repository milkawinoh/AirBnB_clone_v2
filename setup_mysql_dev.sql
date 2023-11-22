-- Prepares MySQL server for Airbnb project

-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS hbnb_dev_db;

-- Create the user if it doesn't exist
CREATE USER IF NOT EXISTS 'hbnb_dev'@'localhost' IDENTIFIED BY 'hbnb_dev_pwd';

-- Grant usage on all databases to the user
GRANT USAGE ON *.* TO 'hbnb_dev'@'localhost';

-- Grant all privileges on the specified database to the user
GRANT ALL PRIVILEGES ON hbnb_dev_db.* TO 'hbnb_dev'@'localhost';

-- Grant select privilege on the performance_schema database to the user
GRANT SELECT ON performance_schema.* TO 'hbnb_dev'@'localhost';
