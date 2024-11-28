select * from follow



select followee,num from
(select followee,count(*) as num
from follow
group by followee) A
inner join
(select follower,count(*) as follows
from follow
group by follower) B
on
A.followee=B.follower