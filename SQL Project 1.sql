-- movie DATABASE
CREATE DATABASE movie;

-- directors TABLE
CREATE TABLE directors (
    director_name VARCHAR(225),
    id INT,
    gender VARCHAR(225),
    aid INT,
    department VARCHAR(225)
);

-- records about the directors using INSERT Statement
INSERT INTO directors (director_name , id , gender , aid , department)
VALUES ( "James Cameron", 4762, "M", 2710, "Directing"),
("Gore Verbinski", 4763, "F", 1704, "Camera"),
("Sam Mendes", 4764, "F", 39, "Directing"),
("Christopher Nolan", 4765, "M", 525, "Production"),
("Andrew Stanton", 4766, "F", 7, "Directing"),
("Sam Raimi", 4767, "F", 7623, "Directing"),
("Byron Howard", 4768, "2", 76595, "Art"),
("Joss Weldon", 4769, "F", 12891, "Costume"),
("David Yates", 4770, "M", 1343, "Sound");

-- updating Byron Howard gender using UPDATE Statement
UPDATE directors 
SET 
    gender = "M"
WHERE
    id = 4768;

-- records on the directors TABLE using SELECT Statement
SELECT 
    *
FROM
    directors;

-- records showing only the females (F) using SELECT Statement
SELECT 
    *
FROM
    directors
WHERE
    gender = "F";

-- records showing the names of people directing using SELECT Statement
SELECT 
    director_name, id, department
FROM
    directors
WHERE
    department = "Directing";

-- directors TABLE without the aid field using DROP Statement
ALTER TABLE directors
DROP aid;

-- included the aid field using ADD Statement
ALTER TABLE directors
ADD aid INT;

-- DELETE Statement
DELETE FROM directors 
WHERE
    id = 4768;

DELETE FROM directors;