{{ config(materialized='view') }}

select
    order_id,
    customer_id,
    order_ts,
    status,
    gross_amount,
    coalesce(discount_amount, 0) as discount_amount,
    gross_amount - coalesce(discount_amount, 0) as net_amount
from {{ ref('raw_orders') }}
where status != 'cancelled'