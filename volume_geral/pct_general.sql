SELECT 
   
    COUNT (start_station_id) AS total_viagens,
    ROUND(
        (CAST(SUM(CASE WHEN  member_casual = 'casual' THEN 1 ELSE 0 END) AS FLOAT) / 
         COUNT(start_station_id)) * 100, 2) AS percentual_casual_geral,
    ROUND(
        (CAST(SUM(CASE WHEN  member_casual = 'member' THEN 1 ELSE 0 END) AS FLOAT) / 
         COUNT(start_station_id)) * 100, 2) AS percentual_member_geral
FROM trips