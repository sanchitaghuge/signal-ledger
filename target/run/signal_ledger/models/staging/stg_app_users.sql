
  
  create view "signal_ledger"."main"."stg_app_users__dbt_tmp" as (
    select
    cast(user_id as varchar) as user_id,
    cast(signup_ts as timestamp) as signup_ts,
    lower(trim(acquisition_channel)) as acquisition_channel,
    upper(trim(country)) as country
from "signal_ledger"."main"."app_users"
  );
