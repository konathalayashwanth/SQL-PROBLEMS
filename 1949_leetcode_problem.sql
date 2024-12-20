select * from friendship1


with cte as
(
select user1_id,user2_id from Friendship1

union all

select user2_id,user1_id from Friendship1
)
select a.user1_id,b.user1_id as user2_id,count(b.user2_id) as commonfriend from cte a left join cte b
on a.user2_id=b.user2_id and a.user1_id<b.user1_id
group by a.user1_id,b.user1_id
having count(b.user2_id)>=3
