DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
use example;
DROP TABLE IF EXISTS users;
CREATE TABLE users(
    id INT,
    name VARCHAR(150)
);