select * from teams


select * from matches

select a.team_id,a.team_name,

coalesce(sum(case when a.team_id=host_team and  host_goals>guest_goals 
					then 3 
	  when a.team_id=guest_team and  guest_goals>host_goals 
	  then 3

	  when  guest_goals =host_goals  then 1
	  end),0) as num_points

	  from teams a left join matches b

	  on a.team_id=b.host_team or a.team_id=b.guest_team

group by a.team_id,a.team_name

order by num_points desc,a.team_id asc;
