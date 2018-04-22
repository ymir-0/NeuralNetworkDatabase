/*
 * this script create the neuron network tables
 * it can be executed by neuralnetwork user
*/
-- TODO : when 2 users : grant CRUD to user (no-admin)
-- clean
DROP TABLE IF EXISTS neuralnetwork.TRAINING_SET; 
DROP TABLE IF EXISTS neuralnetwork.LAYER; 
DROP TABLE IF EXISTS neuralnetwork.PERCEPTRON; 
DROP SCHEMA IF EXISTS neuralnetwork; 
-- create schema
CREATE SCHEMA neuralnetwork;
-- create tables
CREATE TABLE neuralnetwork.PERCEPTRON (
	ID SERIAL UNIQUE,
	COMMENTS TEXT
);
CREATE TABLE neuralnetwork.LAYER (
	ID_PERCEPTRON INTEGER REFERENCES neuralnetwork.PERCEPTRON(ID),
	DEPTH_INDEX INTEGER NOT NULL,
	WEIGHTS NUMERIC[][] NOT NULL,
	BIASES NUMERIC[] NOT NULL,
	PRIMARY KEY (ID_PERCEPTRON, DEPTH_INDEX)
);
CREATE TABLE neuralnetwork.TRAINING_SET (
	ID SERIAL UNIQUE,
	INPUTS NUMERIC[][] NOT NULL,
	EXPECTED_OUTPUTS NUMERIC[][] NOT NULL,
	COMMENTS TEXT
);
