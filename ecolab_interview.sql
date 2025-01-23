create table customer_tbl (id int, email varchar(50))
insert into customer_tbl values (1,'abc@gmail.com'),(2,'xyz@hotmail.com'),
(3,'pqr@outlook.com')


select * from customer_tbl


select substring(email,charindex('@',email)+1,len(email)) as domain from customer_tbl