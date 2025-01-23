
create table empdept_tbl (eid int, dept varchar(50),scores float)
insert into empdept_tbl values (1, 'd1', 1.0),(2, 'd1', 5.28),(3, 'd1', 4.0),(4,'d2', 8.0),(5, 'd1', 2.5),(6, 'd2', 7.0),(7, 'd3', 9.0),(8, 'd4', 10.2)


select * from empdept_tbl

--update coloumns with deptwise highest scores

update empdept_tbl
set scores =(select max(scores) as kk from empdept_tbl as t2 where t2.dept=empdept_tbl.dept)





