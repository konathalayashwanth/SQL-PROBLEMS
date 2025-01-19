select * from flight_info


select a.source,b.destination from flight_info a inner join flight_info b
on a.id=b.id and a.destination=b.source;