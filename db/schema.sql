CREATE DATABASE woofr;

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    post_text VARCHAR(200),
    image TEXT,
    feeling VARCHAR(100),
    user_id INTEGER
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email TEXT,
    password_digest TEXT 
);

