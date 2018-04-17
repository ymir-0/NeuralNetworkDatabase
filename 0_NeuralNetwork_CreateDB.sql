/*
 * this script create the neuron network user & database
 * we can not drop or create database inside a function, so user & database are fixed 
 * it must be executed by administrator
 * do not forget to quote password when asked
*/
-- clean
DROP DATABASE IF EXISTS neuronnetwork;
DROP USER IF EXISTS neuronnetwork;
-- create user
DO $$
DECLARE password TEXT;
BEGIN
	CREATE USER neuronnetwork;
	ALTER USER neuronnetwork WITH ENCRYPTED PASSWORD :password;
END $$;
-- create database
CREATE DATABASE neuronnetwork WITH OWNER=neuronnetwork ENCODING='UTF-8' TEMPLATE=template0;
