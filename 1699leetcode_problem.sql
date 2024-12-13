select * from calls1

with cte as
((
select fromid a,toid b,duration
from calls1
where fromid<toid)

union all

(select toid a ,fromid b,duration
from calls1
where fromid>toid))


select a person1,b person2,count(*) callcount,sum(duration) totalduration from cte
where a<b
group by a,b;