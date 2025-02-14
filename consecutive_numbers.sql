create table  orders89
  (
    order_id    varchar(20) primary key,
    order_date  date        not null
);

delete from orders;



insert into orders89 values
 ('ORD1001', '2021-Jan-01'),
  ('ORD1002', '2021-Feb-01'),
  ('ORD1003', '2021-Feb-02'),
  ('ORD1004', '2021-Feb-03'),
  ('ORD1005', '2021-Mar-01'),
  ('ORD1006', '2021-Jun-01'),
  ('ORD1007', '2021-Dec-25'),
  ('ORD1008', '2021-Dec-26');

  select * from orders89
with t1 as
(
select row_number() over(order by order_date) as id, * from orders89
),t2 as
(
select *,id-row_number() over(order by order_date desc) as diff from t1
),t3 as
(
select *,count(*) over(partition by month(order_date) order by month(order_date))  as mn from t2
where diff<0 
)
select id,order_id,order_date from t3
where mn=3
order by 1 asc

