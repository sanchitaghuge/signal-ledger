select
    event_date,
    user_id,
    count(*) as total_events,
    sum(case when event_name in ('app_open', 'content_view') then 1 else 0 end) as qualifying_active_events,
    sum(case when event_name in ('message_sent', 'content_view', 'reaction_added') then 1 else 0 end) as meaningful_actions
from {{ ref('stg_app_events') }}
group by event_date, user_id
