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

SELECT * FROM bands

JOIN albums ON bands.id = albums.band_id;

SELECT SUM(release_year) FROM albums;

SELECT band_id, COUNT(band_id) FROM albums
GROUP BY band_id;

SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band_id
GROUP BY b.id
HAVING num_albums = 1;


/* /////////////////////////////EXERCISES!!!!!*/
/*///////////////////////////////////////////////////////////////// */

CREATE TABLE songs (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    length FLOAT NOT NULL,
    album_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(album_id) REFERENCES albums(id)
)
/*VZAMEMO PODATKE IZ BANDS IN SICER IME BAND NAME*/
SELECT name AS "Band Name"
FROM bands;

/*POIŠČI NAJSTAREJŠI ALBUM*/

SELECT * FROM albums /*IZBEREŠ POPOLNOMA VSE IZ ALBUMOV*/
WHERE release_year IS NOT NULL /*kjer ima release_year letnico*/
ORDER BY release_year DESC /* IZBEREMO NAJNOVEJSI ALBUM Z DESCENDING ORDER*/
LIMIT 1; /*vrnemo samo 1 rezultat*/

/*IZBEREMO samo VSE BENDE KI IMAJO ALBUME */

SELECT DISTINCT bands.name AS "Band Name"/* DISTINCS IZLOČI PODVOJENE ALBUME*/
FROM bands
JOIN albums ON bands.id = albums.band_id/*to bo izbralo vse različne albume
ki imajo band.id ki imajo isti kot bands.id z albummom
VRNE SAMO BANDE KI IMA DEJANSKE ALBUME*/

/*IZBEREMO BANDE KI NIMAJO ALBUMOV */

SELECT bands.name AS "Band Name"
FROM bands /*izbere iz bands table*/
LEFT JOIN albums ON bands.id = albums.band_id/*LEFT JOIN NARDIMO KER HOČEMO SAMO ALBUME KI NIMAJO BANDA*/
GROUP BY albums.band_id /* razvrstimo jih glede na album id da lahko razberemo kdo ma album id in kdo ne*/
HAVING COUNT (albums.id) = 0;/*če groupamo vse albume z albums id hočemo vrniti vse kar nima vrednosti sepravi 0 oz da nima albuma*/

/*iz tabelemo izberemo album, ki ima najvecjo dolzino*/

SELECT 
albums.name AS Name
albums.release_year AS "Release Year",
SUM(songs.lenght) AS "Duration", /* seštevek vse albumov*/
FROM albums
JOIN songs ON albums.id = songs.album_id /*pridružimo albume v songs table da dobimo seštevek*/
GROUP BY songs.album_id
ORDER BY "Duration" DESC
LIMIT 1; /*vrne samo 1 rezultat*/

/*UPDEJTAMO RELEASE YEAR ALBUMA KI NIMA PODANEGA RELEASE YEAR*/
SELECT * FROM albums
WHERE release_year IS NULL;

UPDATE albums
SET release_year = 1986
WHERE id = 4; /*UPDEJTAMO LETNICO ALBUMA KJE JE ID 4 NA 1986*/

/*VNESEMO GLASBO V NAŠ NAJLUBŠI BAND IN ENEGA NJIHOVIH ALBUMOV*/
INSERT INTO bands(name) /*prvo moramo insert dati v band ker je narejena referenca na albums*/
VALUES ("The Smiths");

SELECT id FROM bands
ORDER BY id DESC
LIMIT 1; /*vrne najnovejši band glede ID ker smo izbrali descent order*/

/*potem id ki ga vrže vn uporabimo spodaj ko vnašamo novi album*/
INSERT INTO albums (name, release_year, band_id)
VALUES ("Revolver", 1966, 6);

/*IZBRIŠI BAND IN ALBUM KI SMO GA DODALI RAVNOKART*/  

DELETE FROM albums
WHERE ID = 20;
DELETE FROM bands
WHERE id = 6;

SELECT * FROM albums;

/*dobi povprčeno dolžino vseh pesmi!*/

SELECT AVG(length) AS "Average Duration"
FROM songs;