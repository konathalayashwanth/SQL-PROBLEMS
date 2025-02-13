


select * from weather1


----Q From the weather table, fetch all the records when London had extremely cold temperature for 3 consecutive days or more.

select id,city,temperature,day from 
(
select *,  case when temperature<0 and lead(temperature) over(order by id)<0
						and lead(temperature,2) over(order by id)<0 then 'yes'

				 when temperature<0 and lag(temperature) over(order by id)<0
						and lead(temperature) over(order by id)<0
						then 'yes'

				 when temperature<0 and lag(temperature) over(order by id)<0
						and lag(temperature,2) over(order by id)<0
						then 'yes'
						else null
						end as day
						from weather1
					) as k
where k.day='yes'