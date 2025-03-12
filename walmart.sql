CREATE TABLE Employee7 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    managerId INT
);

INSERT INTO Employee7 (id, name, department, managerId) VALUES 
(1, 'John', 'HR', NULL),
(2, 'Bob', 'HR', 1),
(3, 'Olivia', 'HR', 1),
(4, 'Emma', 'Finance', NULL),
(5, 'Sophia', 'HR', 1),
(6, 'Mason', 'Finance', 4),
(7, 'Ethan', 'HR', 1),
(8, 'Ava', 'HR', 1),
(9, 'Lucas', 'HR', 1),
(10, 'Isabella', 'Finance', 4),
(11, 'Harper', 'Finance', 4),
(12, 'Hemla', 'HR', 3),
(13, 'Aisha', 'HR', 2),
(14, 'Himani', 'HR', 2),
(15, 'Lily', 'HR', 2);



select * from employee7




select  m.name as managername,m.department,count(e.id) as total
from Employee7 m join employee7 e on m.id=e.managerId and m.department=e.department join
(
select department,count(*) as cnt from employee7
group by department
having count(*)>10
) as d
on m.department=d.department
group by  m.name ,m.department
having count(e.id)>5


----or





