use indianbank

create table students3
(
id int primary key,
student_name varchar(50) not null
);


insert into students3 values
(1, 'James'),
(2, 'Michael'),
(3, 'George'),
(4, 'Stewart'),
(5, 'Robin');


select * from students3


select id,student_name,
						case when id%2<>0 then lead(student_name,1,student_name) over(order by id)  
						     when id%2=0 then lag(student_name) over(order by id)
							 end as newstudent
						from students3
