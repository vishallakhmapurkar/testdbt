{{ config(materialized='view') }}

with raw_customers as (
    select
        customer_id,
        email,
        created_at
    from {{ source('raw', 'customers') }}
)

select
    customer_id,
    email,
    created_at
from raw_customers
