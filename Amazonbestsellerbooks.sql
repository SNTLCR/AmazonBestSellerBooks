-- Create a new database called 'BookBestsellers'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'BookBestsellers'
)
CREATE DATABASE BookBestsellers
GO


--Checking to see if data is imported correctly in the table
SELECT*
FROM BookBestsellers..[book bestsellers ]

--RANKING OF USER RATING FROM HIGHEST TO LOWEST
SELECT Name,Author,User_Rating,[Year]
FROM BookBestsellers..[book bestsellers ]
ORDER BY User_Rating DESC

--MOST EXPENSIVE BESTSELLER BOOK
SELECT Name,Author,Price,[Year]
FROM BookBestsellers..[book bestsellers ]
ORDER BY Price DESC

--LEAST EXPENSIVE BESTSELLER BOOK
SELECT Name,Author,Price,[Year]
FROM BookBestsellers..[book bestsellers ]
ORDER BY Price ASC

--MOST REVIEWED BOOK
SELECT Name,Author,Reviews,[Year]
FROM BookBestsellers..[book bestsellers ]
ORDER BY Reviews DESC

--Fiction vs Non-Fiction
SELECT COUNT(Genre) AS "Number of Fiction Books"
FROM BookBestsellers..[book bestsellers ]
WHERE Genre like '%Fiction%'

SELECT COUNT(Genre) AS "Number of Non-Fiction Books"
FROM BookBestsellers..[book bestsellers ]
WHERE Genre like '%Non Fiction%'

SELECT Genre
FROM BookBestsellers..[book bestsellers ]

--Average Price
SELECT AVG(Price) as "Average Price of Books"
FROM BookBestsellers..[book bestsellers ]

--Year of release of the books
SELECT Name, Author ,[Year]
FROM BookBestsellers..[book bestsellers ]
ORDER BY Year ASC

--Create views for later visualizations

--RANKING OF USER RATING FROM HIGHEST TO LOWEST
CREATE VIEW RankingofUserRating AS
SELECT Name,Author,User_Rating,[Year]
FROM BookBestsellers..[book bestsellers ]
--ORDER BY User_Rating DESC

--MOST EXPENSIVE TO LEAST EXPENSIVE BOOK
CREATE VIEW RankingPrices AS
SELECT Name,Author,Price,[Year]
FROM BookBestsellers..[book bestsellers ]
--ORDER BY Price DESC

--MOST REVIEWED BOOK
CREATE VIEW ReviewRanking AS
SELECT Name,Author,Reviews,[Year]
FROM BookBestsellers..[book bestsellers ]
--ORDER BY Reviews DESC

--Tables for Tableau

1--Top 10 Highest Rated Books
SELECT TOP 10 User_Rating,Name,Author,Year
FROM BookBestsellers..[book bestsellers ]
ORDER BY User_Rating DESC

2--Fiction vs Non-Fiction
SELECT Genre
FROM BookBestsellers..[book bestsellers ]

3--Year released
SELECT Name, Author ,[Year]
FROM BookBestsellers..[book bestsellers ]
ORDER BY Year ASC

4--TOP 10 Highest reviwed books
SELECT TOP 10 Reviews, Name,Author,[Year]
FROM BookBestsellers..[book bestsellers ]
ORDER BY Reviews DESC

5--Prices
SELECT Name,Author,Price
FROM BookBestsellers..[book bestsellers ]
ORDER BY Price ASC