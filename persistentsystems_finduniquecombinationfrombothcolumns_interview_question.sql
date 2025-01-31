use indianbank


--find the unique combination from both origin and destination

CREATE TABLE routes (Origin VARCHAR(50), Destination VARCHAR(50));

INSERT INTO routes VALUES ('Bangalore', 'Chennai'), ('Chennai', 'Bangalore'), ('Pune', 'Chennai'), ('Delhi', 'Pune');


select * from routes


with cte as
(
select *,row_number() over(partition by least(origin,destination),greatest(origin,destination) order by origin) as rn 
from routes
)
select * from cte where rn=1;


---2nd approach

with cte as
(
select *,
row_number() over(partition by case when origin<destination then origin else destination end,
								case when origin>destination then origin else destination
								end order by origin) as rn
								from routes
								)
select origin, destination
from cte
where rn=1
							