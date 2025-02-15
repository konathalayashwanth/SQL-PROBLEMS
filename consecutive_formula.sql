


select * from stadium

select id,visit_date,people from
(
select *, case 
			when people>100 and lead(people,1) over(order by visit_date)>100
		      and   lead(people,2) over(order by visit_date)>100 
			  then 1 

			when people>100 and lag(people) over(order by visit_date)>100
		      and   lead(people) over(order by visit_date)>100
				then 1  
			
			when people>100 and lag(people) over(order by visit_date)>100
		      and   lag(people,2) over(order by visit_date)>100
			  then 1 else 0 end as flag
			from stadium
			) as k
where k.flag=1