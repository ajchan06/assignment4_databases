-- Query 2 (5 pts)
-- What are the names of each album and the artist who created it?

SELECT al.Title AS AlbumName, ar.Name AS ArtistName
FROM albums al
JOIN artists ar ON al.ArtistId = ar.ArtistId
WHERE al.Title IS NOT NULL
  AND ar.Name IS NOT NULL
ORDER BY ar.Name, al.Title;
