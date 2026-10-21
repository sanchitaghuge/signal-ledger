
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        event_name as value_field,
        count(*) as n_records

    from "signal_ledger"."main"."stg_app_events"
    group by event_name

)

select *
from all_values
where value_field not in (
    'app_open','profile_complete','content_view','message_sent','reaction_added'
)



  
  
      
    ) dbt_internal_test