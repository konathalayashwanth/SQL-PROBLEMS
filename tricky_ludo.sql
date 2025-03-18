



select game_id,
case 
when count(interaction_type)=0 then 'No Social Interaction'
when count( distinct case when interaction_type is not null then user_id end)=1 then 'One Sided Interaction'
when count( distinct case when interaction_type is not null then user_id end)=2 
and  count( distinct case when interaction_type='custom_typed' then user_id end)=0 then 'Both Sided Interaction without Customtype'
when count( distinct case when interaction_type is not null then user_id end)=2 
and  count( distinct case when interaction_type='custom_typed' then user_id end)=1 then 'Both Sided Interaction with Customtype'
end as flag
from user_interactions
group by game_id



select * from user_interactions