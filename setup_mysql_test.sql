-- Prepares MySQL server for Airbnb project

-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS hbnb_test_db;

-- Create the user if it doesn't exist
CREATE USER IF NOT EXISTS 'hbnb_test'@'localhost' IDENTIFIED BY 'hbnb_test_pwd';

-- Grant usage on all databases to the user
GRANT USAGE ON *.* TO 'hbnb_test'@'localhost';

-- Grant all privileges on the specified database to the user
GRANT ALL PRIVILEGES ON hbnb_test_db.* TO 'hbnb_test'@'localhost';

-- Grant select privilege on the performance_schema database to the user
GRANT SELECT ON performance_schema.* TO 'hbnb_test'@'localhost';
