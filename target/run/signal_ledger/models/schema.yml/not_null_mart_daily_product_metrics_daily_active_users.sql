
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select daily_active_users
from "signal_ledger"."main"."mart_daily_product_metrics"
where daily_active_users is null



  
  
      
    ) dbt_internal_test