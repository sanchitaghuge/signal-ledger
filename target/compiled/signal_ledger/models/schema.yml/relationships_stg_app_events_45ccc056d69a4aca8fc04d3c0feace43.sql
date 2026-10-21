
    
    

with child as (
    select user_id as from_field
    from "signal_ledger"."main"."stg_app_events"
    where user_id is not null
),

parent as (
    select user_id as to_field
    from "signal_ledger"."main"."stg_app_users"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


