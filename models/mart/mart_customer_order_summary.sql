{{ config(materialized='view') }}

with base_metrics as (
    select 
        c.customer_id, 
        c.email, 
        count(o.order_id) as order_count, 
        coalesce(sum(o.net_amount), 0) as total_net_amount, 
        min(o.order_ts) as first_order_ts, 
        max(o.order_ts) as latest_order_ts 
    from {{ ref('stg_customers') }} as c 
    left join {{ ref('stg_orders') }} as o on c.customer_id = o.customer_id 
    group by 1, 2
),

transformed as (
    select 
        *,
        date(latest_order_ts) as latest_order_date,
        date_diff(current_date(), date(latest_order_ts), day) as days_since_latest_order,
        (coalesce(total_net_amount, 0) >= 1000) as is_high_value_customer
    from base_metrics
)

select * from transformed
