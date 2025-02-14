use indianbank

create table  weather3
	(
		id 					int 				primary key,
		city 				varchar(50) not null,
		temperature int 				not null,
		day 				date				not null
	);


insert into weather3 values
	(1, 'London', -1,'2021-01-01'),
	(2, 'London', -2, '2021-01-02'),
	(3, 'London', 4, '2021-01-03'),
	(4, 'London', 1, '2021-01-04'),
	(5, 'London', -2, '2021-01-05'),
	(6, 'London', -5, '2021-01-06'),
	(7, 'London', -7, '2021-01-07'),
	(8, 'London', 5, '2021-01-08'),
	(9, 'London', -20, '2021-01-09'),
	(10, 'London', 20, '2021-01-10'),
	(11, 'London', 22, '2021-01-11'),
	(12, 'London', -1, '2021-01-12'),
	(13, 'London', -2, '2021-01-13'),
	(14, 'London', -2, '2021-01-14'),
	(15, 'London', -4, '2021-01-15'),
	(16, 'London', -9, '2021-01-16'),
	(17, 'London', 0, '2021-01-17'),
	(18, 'London', -10, '2021-01-18'),
	(19, 'London', -11, '2021-01-19'),
	(20, 'London', -12, '2021-01-20'),
	(21, 'London', -11, '2021-01-21');
COMMIT;


select * from weather3


--------Q  Finding n consecutive records where temperature is below zero. And table has a primary key.

with t1 as
(
select *,id-row_number() over(order by id) as diff from weather3
where temperature<0
),t2 as
(
select * ,count(*) over(partition by diff order by diff) as cnt from t1
)
select id,city,temperature,day from t2
where cnt=5