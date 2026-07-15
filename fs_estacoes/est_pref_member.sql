SELECT
a.start_station_id,
b.station_name,
     COUNT(a.start_station_id) AS preferidas_member

FROM trips as a

LEFT JOIN dim_station as b
ON a.start_station_id = b.station_id 

WHERE a.member_casual = 'member'
GROUP BY a.start_station_id, b.station_name
ORDER BY preferidas_member DESC
LIMIT 100;