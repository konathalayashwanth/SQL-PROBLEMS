create table billing
(
      customer_id               int
    , customer_name             varchar(1)
    , billing_id                varchar(5)
    , billing_creation_date     date
    , billed_amount             int
);

insert into billing values (1, 'A', 'id1', '10-10-2020', 100);
insert into billing values (1, 'A', 'id2', '11-11-2020', 150);
insert into billing values (1, 'A', 'id3', '12-11-2021', 100);
insert into billing values (2, 'B', 'id4', '10-11-2019', 150);
insert into billing values (2, 'B', 'id5', '11-11-2020', 200);
insert into billing values (2, 'B', 'id6', '12-11-2021', 250);
insert into billing values (3, 'C', 'id7', '01-01-2018', 100);
insert into billing values (3, 'C', 'id8', '05-01-2019', 250);
insert into billing values (3, 'C', 'id9', '06-01-2021', 300);


SELECT * FROM BILLING

with cte as
(
select customer_id,customer_name,SUM(case when year(billing_creation_date)=2019 then billed_amount else 0 end) as bill_amt_2019,
			SUM(case when year(billing_creation_date)=2020 then billed_amount else 0 end) as bill_amt_2020,
			SUM(case when year(billing_creation_date)=2021 then billed_amount else 0 end) as bill_amt_2021,
			count(case when year(billing_creation_date)=2019 then 1 else null end  ) as cnt_2019,
			count(case when year(billing_creation_date)=2020 then 1 else null end  ) as cnt_2020,
			count(case when year(billing_creation_date)=2021 then 1 else null end  ) as cnt_2021
from billing
group by customer_id,customer_name
)
select customer_id,
      customer_name,

round((bill_amt_2019+bill_amt_2020+bill_amt_2021)/
(case when cnt_2019=0 then 1 else cnt_2019 end 
+
case when cnt_2020=0 then 1 else cnt_2020 end
+
case when cnt_2021=0 then 1 else cnt_2021 end  ),2) avgrevenue
from cte