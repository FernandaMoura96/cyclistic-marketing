SELECT AVG(ride_length_seconds) AS mediana
FROM (
    SELECT ride_length_seconds
    FROM trips
    ORDER BY ride_length_seconds
    LIMIT 2 - (SELECT COUNT(*) FROM trips) % 2    
    OFFSET (SELECT (COUNT(*) - 1) / 2 FROM trips) 
) AS subconsulta;