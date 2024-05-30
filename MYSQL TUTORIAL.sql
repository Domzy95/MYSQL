CREATE DATABASE test;
DROP DATABASE test;
CREATE DATABASE record_company;
USE record_company;


CREATE TABLE bands (
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE albums (
id INT NOT NULL auto_increment,
name VARCHAR(255) NOT NULL,
release_year INT,
band_id INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY(band_id) REFERENCES bands(id)
);



INSERT INTO bands (name)
VALUES ("Iron Maiden");

INSERT INTO bands(name)
VALUES ("Deuce"),("Avenged Sevenfold"),
("Ankor");

SELECT * FROM bands;

SELECT * FROM bands LIMIT 2;

SELECT name FROM bands;

SELECT id AS "ID", name AS "Band Name" 
FROM bands;

SELECT * FROM bands ORDER BY  name;

INSERT INTO albums (name, release_year, band_id)
VALUES ("The Number of the Beasts", 1985, 1),
("Power Slave", 1984, 1),
("Nightmare",2018,2),
("Nightmare", 2010, 3),
("Test Album", NULL, 3);

SELECT * FROM albums;

SELECT * FROM albums
WHERE release_year < 2000;

SELECT DISTINCT name FROM albums;

UPDATE albums
SET release_year = 1982
WHERE id = 1;

SELECT * FROM albums
WHERE name LIKE "%er%" OR band_id = 2;

SELECT * FROM albums
WHERE release_year = 1984 AND band_id = 1;

SELECT *FROM albums
WHERE release_year BETWEEN 2000 AND 2018;

SELECT * FROM albums
WHERE release_year IS NULL;

DELETE FROM albums 
WHERE id = 5;

SELECT * FROM albums;