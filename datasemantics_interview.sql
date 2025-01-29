create table tbl_cnt (col1 int, col2 varchar(50))


insert into tbl_cnt values (1, 'a,b,c'),(2, 'a,b')


select * from tbl_cnt


select col1,len(replace(col2,',','')) as cnt from tbl_cnt