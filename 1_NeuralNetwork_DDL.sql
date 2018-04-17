/*
 * this script create the neuron network tables
 * it can be executed by neuronnetwork user
*/
-- clean
DROP TABLE IF EXISTS neuronnetwork.LAYER; 
DROP TABLE IF EXISTS neuronnetwork.PERCEPTRON; 
DROP SCHEMA IF EXISTS neuronnetwork; 
-- create schema
CREATE SCHEMA neuronnetwork;
-- create tables
CREATE TABLE neuronnetwork.PERCEPTRON (
	ID SERIAL UNIQUE,
	COMMENTS TEXT
);
CREATE TABLE neuronnetwork.LAYER (
	ID SERIAL UNIQUE,
	ID_PERCEPTRON INTEGER REFERENCES neuronnetwork.PERCEPTRON(ID),
	DEPTH_INDEX INTEGER NOT NULL,
	WEIGHTS NUMERIC[][] NOT NULL,
	BIASES NUMERIC[] NOT NULL
);
