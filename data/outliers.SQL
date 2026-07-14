SELECT ride_id, ride_length_seconds, member_casual
FROM trips
ORDER BY ride_length_seconds DESC
LIMIT 10;


--decidi não considerar como outliers,
--pessoas em viagens de lazer podem facilmente passar mais de 2h com a bike
--se considerarmos,passeios na orla com amigos,piqueniques,ou até mesmo passeios de bike com a família. 