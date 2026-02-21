-- Query 8 (25 pts)
-- What is the total length of each playlist in hours?
-- List only playlists longer than 2 hours, with playlist id, name,
-- and length rounded to two decimals.

SELECT
    p.PlaylistId,
    p.Name AS PlaylistName,
    ROUND(SUM(t.Milliseconds) / 3600000.0, 2) AS LengthInHours
FROM playlists p
JOIN playlist_track pt ON p.PlaylistId = pt.PlaylistId
JOIN tracks t          ON pt.TrackId   = t.TrackId
WHERE p.Name IS NOT NULL
GROUP BY p.PlaylistId, p.Name
HAVING SUM(t.Milliseconds) / 3600000.0 > 2
ORDER BY LengthInHours DESC;
