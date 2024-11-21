/* Write your T-SQL query statement below */
with t1 as (select id, visit_date, people, id - row_number() over(order by id) as rnum
from stadium
where people >= 100)

select id, visit_date, people 
from t1
where rnum in (
    select rnum
    from t1
    group by rnum
    having count(*) >= 3
)