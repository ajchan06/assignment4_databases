-- Query 9 (25 pts) — Creative Addition
--
-- QUESTION:
-- For each genre, which tracks are the top 3 best-sellers (by total quantity sold)?
-- Show the genre name, track name, artist name, total units sold, and the rank within the genre.
--
-- EXPLANATION:
-- This query joins genres → tracks → invoice_items to compute how many units of each
-- track have been sold. It then uses the window function RANK() partitioned by genre
-- to rank tracks within their genre from best-seller (#1) to least. Only the top 3
-- ranked tracks per genre are returned (ties share the same rank).
--
-- WHAT THE RESULTS MEAN:
-- Each row shows a top-selling track within its genre, how many copies were sold,
-- and where it ranks among all tracks in that genre. This is useful for understanding
-- which content drives revenue in each musical category.

SELECT
    genre,
    track_name,
    artist_name,
    total_sold,
    genre_rank
FROM (
    SELECT
        g.Name                                           AS genre,
        t.Name                                           AS track_name,
        ar.Name                                          AS artist_name,
        SUM(ii.Quantity)                                 AS total_sold,
        RANK() OVER (
            PARTITION BY g.GenreId
            ORDER BY SUM(ii.Quantity) DESC
        )                                                AS genre_rank
    FROM genres g
    JOIN tracks t        ON g.GenreId    = t.GenreId
    JOIN albums al       ON t.AlbumId    = al.AlbumId
    JOIN artists ar      ON al.ArtistId  = ar.ArtistId
    JOIN invoice_items ii ON t.TrackId  = ii.TrackId
    WHERE g.Name   IS NOT NULL
      AND t.Name   IS NOT NULL
      AND ar.Name  IS NOT NULL
    GROUP BY g.GenreId, g.Name, t.TrackId, t.Name, ar.ArtistId, ar.Name
) ranked
WHERE genre_rank <= 3
ORDER BY genre, genre_rank;
