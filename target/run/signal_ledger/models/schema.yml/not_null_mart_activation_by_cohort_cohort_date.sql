
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select cohort_date
from "signal_ledger"."main"."mart_activation_by_cohort"
where cohort_date is null



  
  
      
    ) dbt_internal_test