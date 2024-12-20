select * from relations


with cte as
(
select a.user_id as user1_id,b.user_id as user2_id,b.follower_id from relations a left join relations b
on a.user_id<b.user_id and a.follower_id=b.follower_id
),cte2 as
(
select user1_id,user2_id,count( follower_id) as maxcommon from cte
group by user1_id,user2_id
)
select * from cte2 where maxcommon = (select max(maxcommon) from cte2)

