SELECT 
    member_casual,
    CASE strftime('%w', started_at)
        WHEN '0' THEN 'Domingo'
        WHEN '1' THEN 'Segunda'
        WHEN '2' THEN 'Terca'
        WHEN '3' THEN 'Quarta'
        WHEN '4' THEN 'Quinta'
        WHEN '5' THEN 'Sexta'
        WHEN '6' THEN 'Sabado'
    END AS dia_da_semana,
    COUNT(*) AS total_viagens
FROM trips
GROUP BY member_casual, dia_da_semana
ORDER BY member_casual, strftime('%w', started_at)