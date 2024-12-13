select * from boxes


select * from chests

with cte as
(
select a.applecount+coalesce(b.applecount,0) as apple,coalesce(b.orangecount,0)+a.orangecount as orange from boxes a left join chests b
on a.chestid=b.chestid
)
select sum(apple) as apples,sum(orange) as oranges from cte