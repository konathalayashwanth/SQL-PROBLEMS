select * from contests

select * from users1


with cte as
(
(select goldmedal as users,contestid from contests)

union all

(select silvermedal as users,contestid from contests)

union all

(select bronzemendal as users,contestid from contests)
),cte2 as
(
select *,ROW_NUMBER() over(partition by users order by contestid) rk from cte
),cte3 as
(
(
select users from cte2
group by users
having count(*)>=3)

union 

(select goldmedal as users from contests
group by goldmedal
having count(*)>=3)
)


select b.userid,b.mail from cte3 a left join users1 b
on a.users=b.userid

