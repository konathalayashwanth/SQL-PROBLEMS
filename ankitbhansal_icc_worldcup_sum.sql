create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

select * from icc_world_cup;




--wins

with matches as
(
select team_1 as team from icc_world_cup
union all
select team_2 as team from icc_world_cup
),noofmatches as
(
select team,count(*) as totalmatchesplayed from matches
group by team
)
select  team,count(*) as  noofwins,totalmatchesplayed,totalmatchesplayed-count(*) as nooflosses from noofmatches left join icc_world_cup
on noofmatches.team=icc_world_cup.winner 
group by team,winner,totalmatchesplayed





