-- script that creates a table users
-- with the following requirements
CREATE TABLE users IF NOT EXISTS (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
	email VARCHAR(255) NOT NULL UNIQUE,
	name VARCHAR(255)
	);
