 -- Tempo médio em segundos,as viagens realizadas por membros, 
 --com duração maior ou igual a 3 minutos (comprovando que a bike saiu da estação)
 -- e menor ou igual a 24 horas (comprovando que a bike foi devolvida na estação).

SELECT 
    AVG(CASE WHEN member_casual = 'member' THEN ride_length_seconds END) AS average_member,
    AVG(CASE WHEN member_casual = 'casual' THEN ride_length_seconds END) AS average_casual,
    AVG(CASE WHEN member_casual = 'member' THEN ride_length_seconds END) - 
    AVG(CASE WHEN member_casual = 'casual' THEN ride_length_seconds END) AS diferenca
FROM trips
WHERE  ride_length_seconds >= 180 
  AND ride_length_seconds <= 86400


--Os dados mostram que usuários causuai usam o serviço por um período de tempo maior do que os membros,
-- com uma diferença de aproximadamente 1.698 segundos (16,3 minutos).
--Usando a formula de conversão para porcetagem, podemos calcular a diferença percentual entre os dois grupos.
--A fórmula para calcular a diferença percentual é:
--(Diferença / Média dos Membros) * 100, Oque revela que Usuários casuais pedalam, em média, 232,60% mais tempo do que os membros