DROP TABLE IF EXISTS directors;

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

SELECT 
    *
FROM
    directors;
    
-- QUESTION ONE
SELECT 
    COUNT(id) AS num_directing
FROM
    directors;
WHERE department = "Directing"

-- QUESTION TWO
SELECT SUM(aid) AS total_aid
FROM directors;

-- QUESTION THREE
SELECT 
    COUNT(gender) AS num_directing
FROM
    directors;
WHERE gender = "F", department = "camera"

-- QUESTION FOUR
SELECT CASE WHEN gender = "F" THEN "Female"
WHEN gender = "M" THEN "Male"
ELSE "Not_indicated"
END 
FROM directors;

-- QUESTION FIVE
SELECT 
    *
FROM
    directors
WHERE
    id = (4770 , 4767);

-- QUESTION SIX
SELECT 
    title, popularity, tagline
FROM
    movies
WHERE
    release_date > '2020/01/01';

-- QUESTION SEVEN
SELECT 
    SUM(budget) AS total_budget
FROM
    movies
WHERE
    revenue > 1000000;

-- QUESTION EIGHT
SELECT 
    AVG(revenue)
FROM
    movies
WHERE
    vote_count BETWEEN 500 AND 1500;

-- QUESTION NINE
SELECT MAX(budget) AS maximum_budget
FROM movies

-- QUESTION TEN
SELECT MIN(budget) AS minimum_budget
FROM movies

-- QUESTION ELEVEN
SELECT *
FROM movies
WHERE release_date < "01/01/2019"

-- QUESTION TWELVE
SELECT title, revenue, popularity
FROM movies
WHERE director_id in (4771, 4777, 4783, 4773, 4808, 4803, 4788);

-- QUESTION THIRTEEN
SELECT 
    *
FROM
    movies
WHERE
    director_id = 4808
        OR popularity > 1000
        AND vote_average BETWEEN 5 AND 10;

-- QUESTION FIFTEEN
SELECT 
    *
FROM
    movies
WHERE
    release_date NOT BETWEEN '2012/01/01' AND '2019/01/01';

-- QUESTION SIXTEEN
SELECT 
    *
FROM
    movies
WHERE
    director_id <> 4788;

-- QUESTION SEVENTH
SELECT 
    uid / popularity AS 'dv_uid'
FROM
    movies;

-- QUESTION EIGHTEEN
SELECT 
    *
FROM
    dept_manager
WHERE
    from_date > '1991-10-01'
        AND to_date < '1992-12-30';

-- QUESTION NINETEEN
SELECT 
    *
FROM
    departments
WHERE
    dept_no = 'd009' OR dept_no = 'd006';

-- QUESTION TWENTY
SELECT 
    SUM(salary), AVG(salary), MIN(salary), MAX(salary)
FROM
    salaries
WHERE
    salary >= 50000;

-- QUESTION TWENTY-ONE
SELECT 
    salary,
    from_date,
    CASE
        WHEN salary >= 70000 THEN 'A'
        WHEN salary >= 40000 THEN 'B'
        ELSE 'C'
    END AS 'salary_category'
FROM
    salaries
WHERE
    from_date > '2000/01/01';