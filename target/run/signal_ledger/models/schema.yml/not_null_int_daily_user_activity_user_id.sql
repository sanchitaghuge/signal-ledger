
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select user_id
from "signal_ledger"."main"."int_daily_user_activity"
where user_id is null



  
  
      
    ) dbt_internal_test