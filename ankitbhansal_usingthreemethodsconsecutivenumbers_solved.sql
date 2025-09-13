---consecutive empty seats 

---method1--windowsfunctions

with diffnum as
(
select *,
row_number() over(order by seat_no) as rn,
seat_no-row_number() over(order by seat_no)  as consec
from bms
where is_empty='y'
),cntdiff as
(
select consec,count(1) as cnt
from diffnum
group by consec
having count(1)>=3
)
select * from diffnum where consec in (select consec from cntdiff)

---method2----advace aggregation


select seat_no,is_empty
from
(
select *,
sum(case when is_empty='y' then 1 else 0 end) over(order by seat_no rows between 2 preceding and current row) as prev2,
sum(case when is_empty='y' then 1 else 0 end) over(order by seat_no rows between 1 preceding and 1 following) as prev1andnext1,
sum(case when is_empty='y' then 1 else 0 end) over(order by seat_no rows between  current row and 2 following) as next2
from bms
) as k
where prev2=3 or prev1andnext1=3 or next2=3


--3 method lead and lag functions

select seat_no,is_empty from
(
select *,
lag(is_empty,1) over(order by seat_no) as prev1,
lag(is_empty,2) over(order by seat_no) as prev2,
lead(is_empty,1) over(order by seat_no) as next1,
lead(is_empty,2) over(order by seat_no) as next2
from bms
) as k
where is_empty='y' and prev1='y' and prev2='y'
or(is_empty='y' and prev1='y' and next1='y')
or (is_empty='y' and next1='y' and next2='y')