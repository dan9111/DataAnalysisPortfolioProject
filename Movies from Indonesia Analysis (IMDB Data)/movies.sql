SELECT * FROM dbo.indonesian_movies_imdb
ORDER BY votes DESC;

-- query genre count and it's average rating
SELECT 
	genre, 
	COUNT(genre) AS genre_count,
	SUM(votes) AS vote_count,
	AVG(users_rating) AS average_rating, 
	STDEV(users_rating) AS stdev_rating
FROM dbo.indonesian_movies_imdb
GROUP BY genre ORDER BY vote_count DESC;

-- query number of movies per year
SELECT
	year,
	COUNT(year) AS movies_count,
	AVG(users_rating) AS average_rating, 
	STDEV(users_rating) AS stdev_rating
FROM dbo.indonesian_movies_imdb
GROUP BY year ORDER BY year ASC;

-- query each directors and how many movies and rating it gets
SELECT
	directors,
	COUNT(directors) as movies_count,
	SUM(votes) AS vote_count,
	AVG(users_rating) AS average_rating, 
	STDEV(users_rating) AS stdev_rating
FROM dbo.indonesian_movies_imdb
GROUP BY directors ORDER BY vote_count DESC;
-- see the correlation of user rating and votes
-- also the correlation of runtime and user rating
SELECT
	(AVG(users_rating * votes) - AVG(users_rating)*AVG(votes))/(STDEV(users_rating)*STDEV(votes)) AS rating_vote_correlation,
	(AVG(users_rating * runtime) - AVG(users_rating)*AVG(runtime))/(STDEV(users_rating)*STDEV(runtime)) AS rating_runtime_correlation
FROM dbo.indonesian_movies_imdb
WHERE users_rating IS NOT NULL and votes IS NOT NULL and runtime IS NOT NULL;