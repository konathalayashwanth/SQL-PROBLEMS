select * from friend$


select * from person$
with friends as
(
select personid,totalnooffriends,totalmarksoffreinds
from
(
select f.personid,p.name as friendname
,count(f.personid) over(partition by f.personid order by (select null)) as totalnooffriends,
sum(p.score) over(partition by f.personid order by (select null)) as totalmarksoffreinds
from person$ p inner join friend$ f
on  p.personid=f.friendid
) as k
group by personid,totalnooffriends,totalmarksoffreinds
)
select p.personid,p.name as personname,f.totalnooffriends,f.totalmarksoffreinds
from friends f inner join person$ p
on f.personid=p.personid
where f.totalmarksoffreinds>100;


