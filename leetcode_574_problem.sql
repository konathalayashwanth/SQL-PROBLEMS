select * from candidate

select * from vote

---write an sql query to report the name of the winning candidate(:i.e candidate who got the largest no of votes)

with cte as
(
select  name,candidateid from candidate c join vote v
on c.id=v.candidateid
group by name,candidateid
having count(*)>1
)
select name from cte