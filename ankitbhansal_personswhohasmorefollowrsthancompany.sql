
with cte as
(
select ec.personal_profile_id,max(cw.followers) as followers from
employee_company ec inner join company_wages cw
on ec.company_id=cw.company_id
group by ec.personal_profile_id
)
select pp.profile_id from personal_profiles pp inner join cte c
on pp.profile_id=c.personal_profile_id
where pp.followers>c.followers