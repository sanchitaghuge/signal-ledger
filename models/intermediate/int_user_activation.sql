with users as (
    select user_id, signup_ts, cast(signup_ts as date) as signup_date, acquisition_channel, country
    from {{ ref('stg_app_users') }}
),
activation_events as (
    select user_id, min(event_ts) as first_profile_complete_ts
    from {{ ref('stg_app_events') }}
    where event_name = 'profile_complete'
    group by user_id
)
select
    u.user_id,
    u.signup_ts,
    u.signup_date,
    u.acquisition_channel,
    u.country,
    a.first_profile_complete_ts,
    case
        when a.first_profile_complete_ts >= u.signup_ts
         and a.first_profile_complete_ts < u.signup_ts + interval '7 days'
        then true else false
    end as activated_within_7d
from users u
left join activation_events a using (user_id)
