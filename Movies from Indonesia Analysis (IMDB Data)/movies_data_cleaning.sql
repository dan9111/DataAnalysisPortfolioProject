-- DATA CLEANING
-- remove unwanted column
ALTER TABLE dbo.indonesian_movies_imdb
DROP COLUMN column12, column13;

-- clean the row where year is null
DELETE FROM dbo.indonesian_movies_imdb
WHERE year IS NULL;

-- clean the row where actors is null
DELETE FROM dbo.indonesian_movies_imdb
WHERE actors IS NULL;

--replace null values with placeholders
--description
UPDATE dbo.indonesian_movies_imdb
SET description = 'No descriptions provided'
WHERE description IS NULL;

--genre
UPDATE dbo.indonesian_movies_imdb
SET genre = 'Unknown Genre'
WHERE genre IS NULL;

--directors
UPDATE dbo.indonesian_movies_imdb
SET directors = 'Unknown Director'
WHERE directors IS NULL;

-- extract only the minutes from runtime column
UPDATE dbo.indonesian_movies_imdb
SET runtime = REPLACE(REPLACE(runtime, ' min', ''), ',', '')
WHERE runtime IS NOT NULL;

-- remove comma delimiter from votes value
UPDATE dbo.indonesian_movies_imdb
SET votes = REPLACE(votes, ',', '');

-- change the null value for the rating into 'Not Rated'
UPDATE dbo.indonesian_movies_imdb
SET rating = 'Not Rated'
WHERE rating IS NULL OR rating = 'Unrated';

-- alter table to change datatype
ALTER TABLE dbo.indonesian_movies_imdb
ALTER COLUMN year INT;
ALTER TABLE dbo.indonesian_movies_imdb
ALTER COLUMN users_rating FLOAT;
ALTER TABLE dbo.indonesian_movies_imdb
ALTER COLUMN votes INT;
ALTER TABLE dbo.indonesian_movies_imdb
ALTER COLUMN runtime INT;