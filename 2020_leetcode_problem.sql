select * from subscriptions

select * from streams

select  count(*) as accountscount from subscriptions a inner join streams b
on a.accountid=b.accountid
where year(streamdate)!=2021 and year(startdate)<year(enddate)----and year(startdate)<=2021 and year(enddate)>=2021 

