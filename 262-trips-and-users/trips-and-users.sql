select
request_at as day,
round(
    cast(sum(case when status!='completed' then 1 else 0 end ) as float)/count(*),
    2
    ) as [cancellation rate]
 from trips t 
 join users u1
 on t.client_id=u1.users_id 
 and u1.banned='No'
 join
 users u2
 on t.driver_id=u2.users_id
  and u2.banned='No'
 where request_at between '2013-10-01' and '2013-10-03'
group by request_at;
