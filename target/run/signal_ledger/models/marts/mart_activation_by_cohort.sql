
    

    create  table
      "signal_ledger"."main"."mart_activation_by_cohort__dbt_tmp"
  
    
    as (
      select
    signup_date as cohort_date,
    acquisition_channel,
    country,
    count(*) as signed_up_users,
    sum(case when activated_within_7d then 1 else 0 end) as activated_users_7d,
    round(
        sum(case when activated_within_7d then 1.0 else 0.0 end) / nullif(count(*), 0),
        4
    ) as activation_rate_7d
from "signal_ledger"."main"."int_user_activation"
group by signup_date, acquisition_channel, country
    );
    
  