CREATE TABLE StudentDetail
(CollegeId INT,StudentId INT,DeptId INT)

INSERT INTO StudentDetail
VALUES
(1,1,101),
(1,2,NULL),
(1,3,NULL),
(1,4,NULL),
(1,11,201),
(1,12,NULL),
(1,13,NULL),
(1,14,NULL)


select * from studentdetail

with cte as
(
select *,count(deptid) over(order by studentid asc) as cnt_deptid
from studentdetail
)
select collegeid,studentid,FIRST_VALUE(deptid) over(partition by cnt_deptid order by studentid) as new_deptid
from cte