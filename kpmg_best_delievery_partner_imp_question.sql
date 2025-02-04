
CREATE TABLE Delievry_Partner (
    Brand_1 VARCHAR(512),
    Brand_2 VARCHAR(512),
    Brand_3 VARCHAR(512),
    Winner VARCHAR(512)
);

INSERT INTO Delievry_Partner (Brand_1, Brand_2, Brand_3, Winner) VALUES
 ('A', 'B', 'C', 'B'),
 ('B', 'C', 'E', 'E'),
 ('C', 'A', 'D', 'D'),
 ('D', 'E', 'A', 'A'),
 ('F', 'B', 'C', 'F');

 with cte as
 (
select brand_1 as brand_name,count(*) as cnt from Delievry_Partner
group by brand_1
union all
select brand_2 as brand_name,count(*) as cnt from Delievry_Partner
group by brand_2
union all
select Brand_3 as brand_name,count(*) as cnt from Delievry_Partner
group by brand_3
),cte2 as
(
select brand_name,sum(cnt) as noofrides
from cte
group by brand_name
),cte3 as
(
select brand_name,noofrides,count(winner) as wins from cte2 left join Delievry_Partner
on cte2.brand_name=Delievry_Partner.Winner
group by brand_name,noofrides
)
select brand_name,noofrides,wins,noofrides-wins as losses
from cte3
