create table batch (batch_id varchar(10), quantity integer);
create table orders45 (order_number varchar(10), quantity integer);


insert into batch values ('B1', 5);
insert into batch values ('B2', 12);
insert into batch values ('B3', 8);

insert into orders45 values ('O1', 2);
insert into orders45 values ('O2', 8);
insert into orders45 values ('O3', 2);
insert into orders45 values ('O4', 5);
insert into orders45 values ('O5', 9);
insert into orders45 values ('O6', 5);


select * from  batch

select * from orders45


-

with batch_cte as
(
select *,row_number() over(order by batch_id) as rn from
(
     with batch_split as
     (
		  select batch_id,1 as quantity from batch
		   union all
		   select b.batch_id,batch_split.quantity+1 from batch_split  join batch b
		   on b.batch_id=batch_split.batch_id and b.quantity>batch_split.quantity
		     )
			    select batch_id,1 as quantity from batch_split
				   ) as x),
order_cte as
(
select *,row_number() over(order by order_number) as rn from
(
   with order_split as
(
   select order_number,1 as quantity from orders45
   union all
   select b.order_number,order_split.quantity+1 from order_split  join orders45 b
   on b.order_number=order_split.order_number and b.quantity>order_split.quantity
   )
   select order_number,1 as quantity from order_split
   ) as k
 )
 select o.order_number,b.batch_id,sum(o.quantity) as quantity from order_cte o left join batch_cte b
 on o.rn=b.rn
 group by o.order_number,b.batch_id
 order by 1,2 asc








