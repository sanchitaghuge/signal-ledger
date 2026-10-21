with activity as (
    select *
    from "signal_ledger"."main"."int_daily_user_activity"
),
daily as (
    select
        event_date,
        count(distinct case when qualifying_active_events > 0 then user_id end) as daily_active_users,
        sum(meaningful_actions) as meaningful_actions,
        sum(meaningful_actions) * 1.0
          / nullif(count(distinct case when qualifying_active_events > 0 then user_id end), 0)
          as meaningful_actions_per_active_user
    from activity
    group by event_date
)
select
    event_date,
    daily_active_users,
    meaningful_actions,
    round(meaningful_actions_per_active_user, 2) as meaningful_actions_per_active_user
from daily