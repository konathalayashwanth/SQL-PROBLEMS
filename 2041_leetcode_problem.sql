select * from candidates

select * from rounds


with cte as
(
select candidateid,yearsofexperience,interviewid from candidates
where yearsofexperience>=2
)
select candidateid from cte a join rounds b
on a.interviewid=b.interviewid
group by candidateid
having sum(score)>15