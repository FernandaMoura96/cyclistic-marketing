WITH cont_dia AS (
    SELECT 
        strftime('%m', started_at) AS mes,
        member_casual,
        CASE strftime('%w', started_at)
            WHEN '0' THEN 'Dom' WHEN '1' THEN 'Seg' WHEN '2' THEN 'Ter'
            WHEN '3' THEN 'Qua' WHEN '4' THEN 'Qui' WHEN '5' THEN 'Sex'
            WHEN '6' THEN 'Sáb'
        END AS dia_semana,
        strftime('%w', started_at) AS dia_num, -- Mantém o número para ordenação correta
        COUNT(*) AS total_viagens
    FROM trips
    GROUP BY mes, member_casual, dia_semana
)

SELECT 
    mes,
    member_casual,
    dia_semana,
    total_viagens
FROM cont_dia
GROUP BY mes, member_casual, dia_semana
ORDER BY 
    mes ASC, 
    member_casual ASC, 
    total_viagens DESC

--Dias da semana mais/menos usado por cada tipo

--casual
-- janeiro  : quinta/sabado 
--fevereiro : domingo/ quinta
--março : domingo/ segunda 

--member 
--janeiro: quinta/ sabado
--fev :terça/ domingo
-- março :terça / sabado 
