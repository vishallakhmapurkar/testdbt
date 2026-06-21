{{ config(materialized='view') }}

with raw_customers as (
    select * from {{ source('raw', 'customers') }}
)

select
    customer_id,
    email,
    SAFE_CAST(created_at AS TIMESTAMP) AS created_at
from raw_customers
