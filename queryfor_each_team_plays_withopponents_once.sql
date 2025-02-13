create table teams2
    (
        team_code       varchar(10),
        team_name       varchar(40)
    );

insert into teams2 values ('RCB', 'Royal Challengers Bangalore');
insert into teams2 values ('MI', 'Mumbai Indians');
insert into teams2 values ('CSK', 'Chennai Super Kings');
insert into teams2 values ('DC', 'Delhi Capitals');
insert into teams2 values ('RR', 'Rajasthan Royals');
insert into teams2 values ('SRH', 'Sunrisers Hyderbad');
insert into teams2 values ('PBKS', 'Punjab Kings');
insert into teams2 values ('KKR', 'Kolkata Knight Riders');
insert into teams2 values ('GT', 'Gujarat Titans');
insert into teams2 values ('LSG', 'Lucknow Super Giants');



select * from teams2

--Q

with matches as
(
select row_number() over(order by team_name asc) as id,team_code,team_name
from teams2 
)
select team.team_name as teams,opponent.team_name from matches as team join matches as  opponent
on team.id<opponent.id