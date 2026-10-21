
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        acquisition_channel as value_field,
        count(*) as n_records

    from "signal_ledger"."main"."stg_app_users"
    group by acquisition_channel

)

select *
from all_values
where value_field not in (
    'organic','paid_social','paid_search','referral'
)



  
  
      
    ) dbt_internal_test