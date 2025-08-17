

with cte as
(
select *,
  case when brand1<brand2 then concat(brand1,brand2,year) else concat(brand2,brand1,year) end as pairid
  from brands
),cte2_rn as
(
select *,
 row_number() over(partition by pairid order by pairid) as rn
 from cte
 )
 select brand1,brand2,year,custom1,custom2,custom3,custom4
 from cte2_rn
 where rn =1 or (custom1<>custom3 and custom2<>custom4)