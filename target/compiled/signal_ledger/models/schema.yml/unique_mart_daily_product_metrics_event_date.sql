
    
    

select
    event_date as unique_field,
    count(*) as n_records

from "signal_ledger"."main"."mart_daily_product_metrics"
where event_date is not null
group by event_date
having count(*) > 1


