/* Write your T-SQL query statement below */
with requests as
(
select 
requester_id,count(*) as noofrequests
from requestaccepted
group by requester_id 
),accepters as
(
select 
accepter_id,
count(*) as noofaccepters
from requestaccepted
group by accepter_id 
)
select top 1
isnull(r.requester_id,a.accepter_id) as id,
isnull(r.noofrequests,0) + isnull(a.noofaccepters,0) as num
 from requests r full outer join accepters a
on r.requester_id=a.accepter_id 
order by num desc;