select * from sources


select * from target


select 
sid,
case when s.sname!=t.tname then 'mismatch' 
	 when t.tname IS NULL then 'newinsource'
end as comment
from sources s left join targets t
on s.sid=t.tid
where case when s.sname!=t.tname then 'mismatch' 
	 when t.tname IS NULL then 'newinsource'
end is not null
union all
select tid as id,
case when s.sname IS null then 'newintarget' end as comment
from targets t left join sources s
on t.tid=s.sid
where case when s.sname IS null then 'newintarget' end is not null