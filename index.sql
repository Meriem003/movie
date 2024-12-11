-- Name: meryam salhi
-- Email: meryemsalhi590@gmail.com

-- creation database

CREATE DATABASE users_subscription;
USE users_subscription;

--creation des tableaux
CREATE TABLE Users (
    USERID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    RegistrationDATE DATE NOT NULL,
    SubscriptionID INT NOT NULL
);

CREATE TABLE review (
    REVIEWID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    USERID INT NOT NULL,
    MOVIEID INT NOT NULL,
    RATING INT DEFAULT 0 CHECK (RATING BETWEEN 0 AND 10),
    REVIEWTEXT TEXT,
    reviewDATA DATE NOT NULL
);

CREATE TABLE Watchhistory (
    WatchhistoryID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    USERID INT NOT NULL,
    MOVIEID INT NOT NULL,
    WatchDATE DATE NOT NULL,
    CompletionPercentage INT DEFAULT 0 CHECK (CompletionPercentage BETWEEN 0 AND 100)
);

CREATE TABLE movie (
    MOVIEID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    titre VARCHAR(100) NOT NULL,
    genre VARCHAR(100) NOT NULL,
    releaseYEAR INT NOT NULL,
    duration INT NOT NULL,
    rating VARCHAR(10) NOT NULL
);

CREATE TABLE Subscription (
    SubscriptionID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Subscriptiontype VARCHAR(50),
    CONSTRAINT chk_Subscriptiontype CHECK (Subscriptiontype IN ('Premium', 'Basic')),
    monthlyfee DECIMAL(10,2) NOT NULL
);

-- foreing key

ALTER TABLE Users
ADD CONSTRAINT FK_SubscriptionID
FOREIGN KEY (SubscriptionID) REFERENCES Subscription(SubscriptionID);

ALTER TABLE review
ADD CONSTRAINT FK_userID
FOREIGN KEY (USERID) REFERENCES Users(USERID);

ALTER TABLE review
ADD CONSTRAINT FK_movieID
FOREIGN KEY (MOVIEID) REFERENCES movie(MOVIEID);

ALTER TABLE Watchhistory
ADD CONSTRAINT FK_watchhistory_movieID
FOREIGN KEY (MOVIEID) REFERENCES movie(MOVIEID);

ALTER TABLE Watchhistory
ADD CONSTRAINT FK_watchhistory_userID
FOREIGN KEY (USERID) REFERENCES Users(USERID);


-- insert les données

INSERT INTO Watchhistory (USERID, MOVIEID, WatchDATE, CompletionPercentage)
VALUES
(1, 1, '2023-01-20', 100),
(2, 2, '2023-02-25', 85),
(3, 3, '2023-03-15', 75),
(4, 4, '2023-04-10', 90),
(5, 5, '2023-05-18', 100),
(6, 6, '2023-06-05', 60),
(7, 7, '2023-07-25', 95),
(8, 8, '2023-08-18', 100),
(9, 9, '2023-09-12', 80),
(10, 10, '2023-10-10', 70),
(11, 11, '2023-11-22', 100),
(12, 12, '2023-12-20', 50),
(13, 13, '2023-01-10', 90),
(14, 14, '2023-02-18', 100),
(15, 15, '2023-03-28', 100),
(16, 16, '2023-04-15', 75),
(17, 17, '2023-05-25', 100),
(18, 18, '2023-06-30', 80),
(19, 19, '2023-07-20', 95),
(20, 20, '2023-08-25', 100);

INSERT INTO review (USERID, MOVIEID, RATING, REVIEWTEXT, reviewDATA)
VALUES
(1, 1, 9, 'Amazing movie!', '2023-01-16'),
(2, 2, 10, 'A masterpiece.', '2023-02-21'),
(3, 3, 8, 'Great action scenes.', '2023-03-11'),
(4, 4, 7, 'Interesting but overrated.', '2023-04-06'),
(5, 5, 9, 'Heartwarming story.', '2023-05-13'),
(6, 6, 10, 'Mind-blowing!', '2023-06-02'),
(7, 7, 8, 'Great performances.', '2023-07-21'),
(8, 8, 9, 'Classic sci-fi.', '2023-08-16'),
(9, 9, 10, 'A timeless masterpiece.', '2023-09-11'),
(10, 10, 8, 'Epic storytelling.', '2023-10-06'),
(11, 11, 7, 'A bit dated but good.', '2023-11-21'),
(12, 12, 9, 'An emotional journey.', '2023-12-16'),
(13, 13, 6, 'Too long.', '2023-01-06'),
(14, 14, 9, 'Childhood favorite.', '2023-02-16'),
(15, 15, 8, 'Great team-up movie.', '2023-03-26'),
(16, 16, 10, 'Mind-bending plot.', '2023-04-11'),
(17, 17, 10, 'A modern classic.', '2023-05-31'),
(18, 18, 8, 'Thought-provoking.', '2023-06-26'),
(19, 19, 9, 'Epic battles.', '2023-07-16'),
(20, 20, 8, 'Creepy and intense.', '2023-08-21');

INSERT INTO movie (titre, genre, releaseYEAR, duration, rating)
VALUES
('The Shawshank Redemption', 'Drama', 1994, 142, 'R'),
('The Godfather', 'Crime', 1972, 175, 'R'),
('The Dark Knight', 'Action', 2008, 152, 'PG-13'),
('Pulp Fiction', 'Crime', 1994, 154, 'R'),
('Forrest Gump', 'Drama', 1994, 142, 'PG-13'),
('Inception', 'Sci-Fi', 2010, 148, 'PG-13'),
('Fight Club', 'Drama', 1999, 139, 'R'),
('The Matrix', 'Sci-Fi', 1999, 136, 'R'),
('Goodfellas', 'Crime', 1990, 146, 'R'),
('The Lord of the Rings', 'Fantasy', 2001, 178, 'PG-13'),
('Star Wars', 'Sci-Fi', 1977, 121, 'PG'),
('Avengers: Endgame', 'Action', 2019, 181, 'PG-13'),
('Titanic', 'Romance', 1997, 195, 'PG-13'),
('The Lion King', 'Animation', 1994, 88, 'G'),
('The Avengers', 'Action', 2012, 143, 'PG-13'),
('Interstellar', 'Sci-Fi', 2014, 169, 'PG-13'),
('Parasite', 'Thriller', 2019, 132, 'R'),
('Joker', 'Drama', 2019, 122, 'R'),
('Gladiator', 'Action', 2000, 155, 'R'),
('The Silence of the Lambs', 'Thriller', 1991, 118, 'R');

INSERT INTO Users (FirstName, LastName, Email, RegistrationDATE, SubscriptionID)
VALUES
('John', 'Doe', 'john.doe@example.com', '2023-01-15', 1),
('Jane', 'Smith', 'jane.smith@example.com', '2023-02-20', 2),
('Alice', 'Brown', 'alice.brown@example.com', '2023-03-10', 1),
('Bob', 'Johnson', 'bob.johnson@example.com', '2023-04-05', 2),
('Charlie', 'Wilson', 'charlie.wilson@example.com', '2023-05-12', 1),
('Emma', 'Davis', 'emma.davis@example.com', '2023-06-01', 2),
('Olivia', 'Martinez', 'olivia.martinez@example.com', '2023-07-20', 1),
('Liam', 'Anderson', 'liam.anderson@example.com', '2023-08-15', 2),
('Noah', 'Garcia', 'noah.garcia@example.com', '2023-09-10', 1),
('Ava', 'Rodriguez', 'ava.rodriguez@example.com', '2023-10-05', 2),
('Sophia', 'Hernandez', 'sophia.hernandez@example.com', '2023-11-20', 1),
('Mason', 'Lopez', 'mason.lopez@example.com', '2023-12-15', 2),
('Lucas', 'Gonzalez', 'lucas.gonzalez@example.com', '2023-01-05', 1),
('Ella', 'Perez', 'ella.perez@example.com', '2023-02-15', 2),
('Ethan', 'Nguyen', 'ethan.nguyen@example.com', '2023-03-25', 1),
('Isabella', 'Lewis', 'isabella.lewis@example.com', '2023-04-10', 2),
('Aiden', 'Clark', 'aiden.clark@example.com', '2023-05-30', 1),
('Amelia', 'Walker', 'amelia.walker@example.com', '2023-06-25', 2),
('Logan', 'Hall', 'logan.hall@example.com', '2023-07-15', 1),
('Mia', 'Allen', 'mia.allen@example.com', '2023-08-20', 2);

INSERT INTO Subscription (Subscriptiontype, monthlyfee)
VALUES
('Premium', 19.99),
('Basic', 9.99);


-- Les requêtes
--1
INSERT INTO movie (titre, genre, releaseYEAR, duration, rating)
VALUES ('Data Science Adventures', 'Documentary', 2024, 120, '8');

-- 2
SELECT 
    MOVIEID,
    genre,
    titre,  
    releaseYEAR 
FROM 
    MOVIE  
WHERE 
    genre IN ('Comedy')
    and releaseYEAR > 2020 ;

--3
UPDATE users 
SET subscriptionID = 2 
WHERE subscriptionID = 1;

--4
SELECT
    u.USERID,
    u.FirstName,
    u.LastName,
    s.Subscriptiontype
FROM 
    users u
INNER JOIN 
    subscription s ON u.SubscriptionID = s.SubscriptionID;

-- 5
SELECT 
    u.USERID,
    u.FirstName,
    u.LastName,
    w.MOVIEID
FROM 
    Watchhistory w
INNER JOIN 
    Users u 
ON 
    w.USERID = u.USERID
WHERE 
    w.CompletionPercentage = 100;

-- 6
SELECT 
    MOVIEID,
    titre,
    duration
FROM 
    movie
ORDER BY 
    duration DESC
LIMIT 5;

-- 7
SELECT 
    movie.titre,
    FLOOR(AVG(watchhistory.CompletionPercentage))
FROM 
    watchhistory
INNER JOIN 
    movie
ON 
    movie.MOVIEID = watchhistory.MOVIEID
GROUP BY 
    movie.titre;

-- 8
SELECT 
    s.Subscriptiontype, 
    COUNT(u.USERID)
FROM 
    Users u
INNER JOIN 
    Subscription s ON u.SubscriptionID = s.SubscriptionID
GROUP BY 
    s.Subscriptiontype;


--9
SELECT
    movie.titre,
    review.rating
FROM
    movie
INNER JOIN
    review
ON
    movie.movieid = review.movieid
WHERE
    review.rating > 4;