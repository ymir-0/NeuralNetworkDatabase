/*
 * this script create the neuron network user & database
 * we can not drop or create database inside a function, so user & database are fixed 
 * it must be executed by administrator
 * do not forget to quote password when asked
*/
-- TODO : create 2 users : admin & user (set admin as owner)
-- clean
DROP DATABASE IF EXISTS neuralnetwork;
DROP USER IF EXISTS neuralnetwork;
-- create user
DO $$
DECLARE password TEXT;
BEGIN
	CREATE USER neuralnetwork;
	ALTER USER neuralnetwork WITH ENCRYPTED PASSWORD :password;
END $$;
-- create database
CREATE DATABASE neuralnetwork WITH OWNER=neuralnetwork ENCODING='UTF-8' TEMPLATE=template0;
