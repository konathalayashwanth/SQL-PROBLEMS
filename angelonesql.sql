


select * from tickets1





select top 1 origin,destination,sum(ticket_count) as total from
(
select origin,destination,ticket_count from tickets1
union all
select destination,origin,ticket_count from tickets1
where oneway_round='R'
) as k
group by origin,destination
order by 3 desc