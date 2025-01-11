
with cte as
(
select *,row_number() over(order by id desc) as rn from coffeshop
),cte2 as
(
select *,sum(case when drink is null then 0 else 1 end) over(order by rn) as sr
			from cte	)
select id,first_value(drink) over(partition by sr order by rn) as drink from cte2
