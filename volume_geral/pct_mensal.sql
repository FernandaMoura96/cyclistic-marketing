WITH casual_data 
AS (
    SELECT 
        strftime('%m', started_at) AS mes,
        COUNT(*) AS total_casual
    FROM trips
    WHERE member_casual = 'casual'
    GROUP BY mes
),
member_data
AS (
    SELECT 
        strftime('%m', started_at) AS mes,
        COUNT(*) AS total_member
    FROM trips
    WHERE member_casual = 'member'
    GROUP BY mes
)
SELECT 
    c.mes,
    c.total_casual,
    m.total_member,
    (c.total_casual + m.total_member) AS total_geral,
    -- Percentual de Casuais
    ROUND((CAST(c.total_casual AS FLOAT) / (c.total_casual + m.total_member)) * 100, 2) AS pct_casual,
    -- Percentual de Membros
    ROUND((CAST(m.total_member AS FLOAT) / (c.total_casual + m.total_member)) * 100, 2) AS pct_member
FROM casual_data c
JOIN member_data m ON c.mes = m.mes
ORDER BY c.mes;