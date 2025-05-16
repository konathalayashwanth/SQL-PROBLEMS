use indianbank



create table players1
(player_id int,
group_id int)

insert into players1 values (15,1);
insert into players1 values (25,1);
insert into players1 values (30,1);
insert into players1 values (45,1);
insert into players1 values (10,2);
insert into players1 values (35,2);
insert into players1 values (50,2);
insert into players1 values (20,3);
insert into players1 values (40,3);

create table matches2
(
match_id int,
first_player int,
second_player int,
first_score int,
second_score int)

insert into matches2 values (1,15,45,3,0);
insert into matches2 values (2,30,25,1,2);
insert into matches2 values (3,30,15,2,0);
insert into matches2 values (4,40,20,5,2);
insert into matches2 values (5,35,50,1,1);


select * from matches2

select * from players1

with playersscores as
(
select first_player as playerid,first_score as score from matches2
union all
select second_player as playerid,second_score as score from matches2
),finalscores as
(
select p.playerid,group_id,sum(score) as totalscore from playersscores p inner join players1 p1
on p.playerid=p1.player_id
group by  p.playerid,group_id
)
select * from
(
select *,rank() over(partition by group_id order by totalscore desc,playerid asc) as rn from finalscores
) as k
where k.rn=1
