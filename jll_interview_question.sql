CREATE TABLE employees_tbl1 (empid INT,ename VARCHAR(50),salary INT,managerid INT)

INSERT INTO employees_tbl1 VALUES (1, 'John', 50000, NULL), (2, 'Alice', 40000, 1),(3, 'Bob', 70000, 1), (4, 'Emily', 55000, NULL), (5, 'Charlie', 65000, 4),
(6, 'David', 50000, 4)


select * from employees_tbl1


--get employee name who salary is greater than manage salary


select e.ename as empname,e.salary,m.ename as managername,m.salary from employees_tbl1 e left join employees_tbl1 m
on e.managerid=m.empid
where e.salary>m.salary