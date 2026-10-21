-- Fail the build if core metric invariants are broken.
-- DAU must be non-negative, and activation counts/rates must be logically valid.
select
    'negative_dau' as failure_reason,
    cast(event_date as varchar) as affected_key
from "signal_ledger"."main"."mart_daily_product_metrics"
where daily_active_users < 0

union all

select
    'invalid_activation_rate' as failure_reason,
    cast(cohort_date as varchar) as affected_key
from "signal_ledger"."main"."mart_activation_by_cohort"
where activation_rate_7d < 0
   or activation_rate_7d > 1
   or activated_users_7d > signed_up_users