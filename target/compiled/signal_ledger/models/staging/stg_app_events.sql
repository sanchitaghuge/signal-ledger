select
    cast(event_id as varchar) as event_id,
    cast(user_id as varchar) as user_id,
    cast(event_ts as timestamp) as event_ts,
    cast(event_ts as date) as event_date,
    lower(trim(event_name)) as event_name,
    cast(session_id as varchar) as session_id
from "signal_ledger"."main"."app_events"