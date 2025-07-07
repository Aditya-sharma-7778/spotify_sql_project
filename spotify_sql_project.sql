DROP TABLE IF EXISTS spotify;
CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);
select * from spotify;



--1️⃣ Tracks with more than 1 billion streams
SELECT track,stream
FROM spotify
WHERE stream > 1000000000;


--2️⃣ List all albums with their respective artists
SELECT DISTINCT album, artist
FROM spotify;


--3️⃣ Total number of comments where licensed = TRUE
SELECT SUM(comments) AS total_comments
FROM spotify
WHERE licensed = TRUE;


--4️⃣ Tracks with album type 'single'
SELECT track
FROM spotify
WHERE album_type = 'single';


--5️⃣ Count total number of tracks by each artist

SELECT artist, COUNT(*) AS track_count
FROM spotify
GROUP BY artist;


--6️⃣ Average danceability per album
SELECT album, AVG(danceability) AS avg_danceability
FROM spotify
GROUP BY album;

--7️⃣ Top 5 tracks with highest energy
SELECT track, energy
FROM spotify
ORDER BY energy DESC
LIMIT 5;


--8️⃣ Tracks with official video and their views/likes
SELECT track, views, likes
FROM spotify
WHERE official_video = TRUE;


--9️⃣ Total views per album
SELECT album, SUM(views) AS total_views
FROM spotify
GROUP BY album;


--1️⃣1️⃣ Top 3 most-viewed tracks for each artist (window function)

SELECT artist, track, views
FROM (
    SELECT artist, track, views,
           ROW_NUMBER() OVER (PARTITION BY artist ORDER BY views DESC) AS rank
    FROM spotify
) AS ranked
WHERE rank <= 3;



--1️⃣2️⃣ Tracks where liveness > average liveness
SELECT track, liveness
FROM spotify
WHERE liveness > (SELECT AVG(liveness) FROM spotify);


--1️⃣3️⃣ WITH clause: Energy range per album (max - min)
WITH energy_stats AS (
    SELECT album,
           MAX(energy) AS max_energy,
           MIN(energy) AS min_energy
    FROM spotify
    GROUP BY album
)
SELECT album,
       (max_energy - min_energy) AS energy_range
FROM energy_stats;

--14. Retrieve the average tempo for each album type (e.g., album, single)

SELECT album_type, AVG(tempo) AS avg_tempo
FROM spotify
GROUP BY album_type;
--✅ Explanation: Groups by album_type and finds average tempo for each.

--🔢 15. Find the most liked track in each album using window functions

SELECT album, track, likes
FROM (
    SELECT album, track, likes,
           RANK() OVER (PARTITION BY album ORDER BY likes DESC) AS rank
    FROM spotify
) AS ranked
WHERE rank = 1;
--✅ Explanation: Uses RANK() to find the top-liked track per album.

--🔢 16. Show tracks where energy is greater than average AND acousticness is below average

SELECT track, energy, acousticness
FROM spotify
WHERE energy > (SELECT AVG(energy) FROM spotify)
  AND acousticness < (SELECT AVG(acousticness) FROM spotify);
--✅ Explanation: Combines two SELECT AVG(...) subqueries in WHERE.

--🔢 17. Count how many tracks are marked as official and also licensed

SELECT COUNT(*) AS official_and_licensed_tracks
FROM spotify
WHERE official_video = TRUE AND licensed = TRUE;
--✅ Explanation: Filters rows with both flags TRUE and counts them.

--🔢 18. Find artists who have more than 3 tracks with over 100 million streams

SELECT artist, COUNT(*) AS high_stream_count
FROM spotify
WHERE stream > 100000000
GROUP BY artist
HAVING COUNT(*) > 3;
--✅ Explanation: Filters tracks over 100M streams, groups by artist, and shows only those with more than 3 such tracks.



