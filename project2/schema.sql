-- $ sqlite3 schema.db < schema.sql

PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;
DROP TABLE IF EXISTS user_following;
DROP TABLE IF EXISTS Tweets;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    username VARCHAR primary key,
    email VARCHAR,
    password VARCHAR
);

CREATE TABLE user_following (
    username VARCHAR primary key,
    usernameToFollow VARCHAR,
    FOREIGN KEY(username) REFERENCES users(username)
    FOREIGN KEY(usernameToFollow) REFERENCES users(username)
);

CREATE TABLE Tweets(
	username VARCHAR,
	text VARCHAR,
    timestamp DATETIME,
	FOREIGN KEY(username) REFERENCES users(username)
);

COMMIT;
