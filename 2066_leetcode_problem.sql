select * from transactions3



select accountid,day,
				sum(case when type='Deposit' then amount else -1*amount end) over(partition by accountid order by day asc)  as balance
				from transactions3
order by day asc