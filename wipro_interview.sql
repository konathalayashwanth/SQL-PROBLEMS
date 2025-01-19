CREATE TABLE emps_tbl (emp_name VARCHAR(50), dept_id INT, salary INT);

INSERT INTO emps_tbl VALUES ('Siva', 1, 30000), ('Ravi', 2, 40000), ('Prasad', 1, 50000), ('Sai', 2, 20000), ('Anna', 2, 10000);


select * from emps_tbl


with cte as
(
select *,row_number() over(partition by dept_id order by salary desc) as highest,
		 row_number() over(partition by dept_id order by salary ) as lowest
		from emps_tbl
)
select dept_id,max(case when highest=1 then emp_name end )as max_emp_name,
				min(case when lowest =1 then emp_name end) as min_emp_name
				from cte
group by dept_id;



----2ndway

select distinct dept_id,first_value(emp_name) over(partition by dept_id order by salary desc) as max_emp_name,
		first_value(emp_name) over(partition by dept_id order by salary asc) as min_emp_name
		from emps_tbl