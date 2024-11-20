/* Write your T-SQL query statement below */
select
department,
employee,
salary
from
(
    select 
    d.name as department,
    e.name as employee,
    e.salary as salary,
    dense_rank() over(partition by d.name order by e.salary desc) as rankno
    from 
    employee e join department d
    on d.id=e.departmentid
) as h
where h.rankno<4
order by 3 desc;