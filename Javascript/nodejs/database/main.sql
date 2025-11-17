mysql -u root -p

CREATE DATABASE meinprojekt
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

CREATE USER 'meinuser'@'localhost' IDENTIFIED BY 'starkespasswort';

CREATE USER 'meinuser'@'%' IDENTIFIED BY 'starkespasswort';

GRANT ALL PRIVILEGES ON meinprojekt.* TO 'meinuser'@'localhost';

GRANT ALL PRIVILEGES ON meinprojekt.* TO 'meinuser'@'%';

FLUSH PRIVILEGES;

CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE items (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_items_user
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO users (username, email, password)
VALUES ('bob', 'bob@example.com', 'geheim');

INSERT INTO items (user_id, name, description)
VALUES (1, 'Hammer', 'Ein schwerer Hammer');

SELECT 
    users.username,
    items.name,
    items.description
FROM items
JOIN users ON users.id = items.user_id;
