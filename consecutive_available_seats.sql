


create table cinema
(
	seat_id     int    primary key  identity(1,1),
	free        int    not null
)
go




insert into cinema(free)values(1)
insert into cinema(free)values(0)
insert into cinema(free)values(1)
insert into cinema(free)values(1)
insert into cinema(free)values(1)



select seat_id from
(
select *,lead(free) over(order by seat_id) as next_seat
,lag(free) over(order by seat_id) as prev_seat from cinema 
) as g
where g.free=1 and g.next_seat=1
or g.free=1 and g.prev_seat=1
order by g.seat_id