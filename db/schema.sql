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

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    post_id INTEGER,
    comment TEXT
);

ALTER TABLE users ADD icon TEXT;
ALTER TABLE users ADD bio TEXT;
ALTER TABLE users ADD location VARCHAR(200);

UPDATE users SET name = Bacio WHERE id=13;

ALTER TABLE posts ADD COLUMN time_created TEXT;
