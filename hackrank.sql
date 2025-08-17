with hacker_challenge_counts as (
    select 
        a.hacker_id,
        a.name,
        count(b.challenge_id) as challenges_created
    from hackers a
    left join challenges b on a.hacker_id = b.hacker_id
    group by a.hacker_id, a.name
),
hacker_stats as (
    select
        *,
        count(*) over(partition by challenges_created) as no_of_hackers,
        max(challenges_created) over() as max_challenges_created
    from hacker_challenge_counts
)
select 
    hacker_id,
    name,
    challenges_created
from hacker_stats
where no_of_hackers = 1
   or challenges_created = max_challenges_created
order by challenges_created desc, hacker_id;