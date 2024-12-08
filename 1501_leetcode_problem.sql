select * from person


select * from country



select * from   calls


select  b.name as country from person a
inner join
country b
on
left(a.phonenumber,3)=b.countrycode
inner join calls c
on a.id=c.calleid or a.id=c.callerid
group by b.name
having avg(duration)>(select avg(duration) from calls)