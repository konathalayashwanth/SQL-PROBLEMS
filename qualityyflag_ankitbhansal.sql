


with cte as
(
select *,
sum(case when criteria1=criteria2 then 1 else 0 end) over(partition by teamid) as eligiblecount
from Ameriprise_LLC
)
select *,case when criteria1='y' and criteria2='y' and eligiblecount>=2 then 'Y' else 'N' end as qualityflag
from cte


