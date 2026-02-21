-- Query 5 (10 pts)
-- What are the names of the artists who made an album containing the substring "symphony" in the album title?

SELECT DISTINCT ar.Name AS ArtistName
FROM artists ar
JOIN albums al ON ar.ArtistId = al.ArtistId
WHERE LOWER(al.Title) LIKE '%symphony%'
  AND ar.Name IS NOT NULL
ORDER BY ar.Name;
