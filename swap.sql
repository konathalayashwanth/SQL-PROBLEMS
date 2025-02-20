create table employee2(id int identity,name varchar(15),department varchar(15));

insert into employee2 values('John','Sales')
insert into employee2 values('Tom','IT')
insert into employee2 values('Rohit','IT')
insert into employee2 values('shubham','Marketing')
insert into employee2 values('kavya','Management')
insert into employee2 values('Rohan','Sales')
insert into employee2 values('Shivani','IT')


select * from employee2


select *,case when id%2!=0 then lead(department,1,department) over(order by id)
             when id%2=0 then lag(department) over(order by id) 
			 end as swap
			 from employee2