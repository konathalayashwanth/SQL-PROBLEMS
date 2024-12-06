create table sales1
(
	saledate    date    not null,
	fruit       varchar(10)     not null,
	sold_num    int          not null
)
go

insert into sales1 values('2020-05-01','apples',10)
insert into sales1 values('2020-05-01','oranges',8)
insert into sales1 values('2020-05-02','apples',15)
insert into sales1 values('2020-05-02','oranges',15)
insert into sales1 values('2020-05-03','apples',20)
insert into sales1 values('2020-05-03','oranges',0)
insert into sales1 values('2020-05-04','apples',15)
insert into sales1 values('2020-05-04','oranges',16)

select * from sales1



--

select saledate,
sum(case
		when fruit='apples' then sold_num
		else -1* sold_num
	end)as diff
	from sales1
group by saledate;