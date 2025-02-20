create table activity(player_id int,device_id int,event_date date)

insert into activity values(1,2,'2024-12-01');
insert into activity values(1,2,'2024-12-02');
insert into activity values(2,3,'2024-12-05');
insert into activity values(3,1,'2024-12-07');
insert into activity values(3,4,'2024-12-09');

select * from activity

with cte as
(
select distinct count(player_id) as totalplayerscnt from activity
),cte2 as
(
  select *,lead(event_date) over(partition by player_id order by event_date) as nextevent from activity
),cte3 as
(
select count(*)  as consecutivedayscnt  from cte2
where datediff(dd,event_date,nextevent) =1
)
select *,consecutivedayscnt/totalplayerscnt as consecutivedayspercentage from cte3,cte


