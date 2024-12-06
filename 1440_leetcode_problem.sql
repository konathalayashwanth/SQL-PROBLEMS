select  * from variables


select * from expressions



select a.*,
case
		when b.value>c.value and a.operator='>' then 'true'
		when b.value<c.value and a.operator='<' then 'true'
	    when b.value=c.value and a.operator='=' then 'true'
		else 'false'
		end as value
from expressions a inner join variables b
on a.leftoperand=b.name
inner join variables c
on
a.rightoperator=c.name