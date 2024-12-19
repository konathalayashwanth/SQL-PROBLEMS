select * from employees1



with cte as
(
select *,count(*) over(partition by salary ) as rk from employees1
)
select employeeid,name,salary,dense_rank() over(order by salary) as teamid from cte
where rk>=2
