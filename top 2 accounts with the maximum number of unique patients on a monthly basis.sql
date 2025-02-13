-----Q Find the top 2 accounts with the maximum number of unique patients on a monthly basis.



---Note: Prefer the account id with the least value in case of same number of unique patients

select * from patient_logs

select month,account_id,no_of_unique_patients
from
(
select * ,rank() over(partition by month order by no_of_unique_patients desc,account_id asc) as rank
from
(
select month,account_id,count(*) as no_of_unique_patients
from
(
select datename(month,date) as month,account_id,patient_id from patient_logs
) as h
group by month,account_id
) as k
) as m
where m.rank in (1,2);