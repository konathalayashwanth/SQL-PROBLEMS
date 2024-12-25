select *  from flights


with cte as
(
select departureairport as a1,flightcount as f1 from flights

union all

select arrivalairport as a1,flightcount as f1 from flights
),cte2 as
(
select a1,sum(f1) as total from cte
group by a1
),cte3 as
(
select a1 as airportid,rank()  over(order by total desc) as gn from cte2
)
select airportid from cte3
where gn=1