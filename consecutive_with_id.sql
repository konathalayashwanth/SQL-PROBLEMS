create table logs1(id int, num int)

insert into logs1 values(1,1)
insert into logs1 values(2,1)
insert into logs1 values(3,2)
insert into logs1 values(4,2)
insert into logs1 values(5,2)
insert into logs1 values(6,1)
insert into logs1 values(7,3)
insert into logs1 values(8,4)
insert into logs1 values(9,4)



--Q find and sql querie numbers appear atleast three times consecutively


with cte as
(
select *,row_number() over(partition by num order by id) rn from logs1
)
select id,num,count(*) over(partition by consectivetimes order by consectivetimes) as cnt from
(
select *,id-rn  as consectivetimes from cte
) as k


