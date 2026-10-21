
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select activated_within_7d
from "signal_ledger"."main"."int_user_activation"
where activated_within_7d is null



  
  
      
    ) dbt_internal_test