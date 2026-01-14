/* Write your T-SQL query statement below */
with session_duration as (
    select session_id, user_id, datediff(minute, min(event_timestamp), max(event_timestamp)) as duration from app_events
    group by session_id, user_id
),

scroll_count as (
    select session_id, user_id, count(*) as scroll_count from app_events
    where event_type='scroll'
    group by session_id, user_id
),

click_count as (
    select session_id, user_id, count(*) as click_count from app_events
    where event_type='click'
    group by session_id, user_id
),

purchase_count as (
    select session_id, user_id, count(*) as purchase_count from app_events
    where event_type='purchase'
    group by session_id, user_id
)

select
    duration.session_id,
    duration.user_id,
    duration.duration as session_duration_minutes,
    scroll.scroll_count
from session_duration duration
left join scroll_count scroll on duration.session_id=scroll.session_id and duration.user_id=scroll.user_id
left join click_count click on duration.session_id=click.session_id and duration.user_id=click.user_id
left join purchase_count purchase on duration.session_id=purchase.session_id and duration.user_id=purchase.user_id

where 1=1
and duration.duration>30
and scroll.scroll_count>4
and coalesce(1.0*click.click_count/scroll.scroll_count, 0)<0.2
and coalesce(purchase.purchase_count, 0)=0

order by scroll_count desc, session_id