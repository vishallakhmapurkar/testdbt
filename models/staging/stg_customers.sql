{{ config(materialized='view') }}

select
    customer_id,
    email{{ config(materialized='view') }}

with raw_customers as (
    select 1 as customer_id, 'alice@example.com' as email, timestamp('2024-01-01') as created_at, false as is_deleted
    union all
    select 2 as customer_id, 'bob@example.com' as email, timestamp('2024-01-02') as created_at, false as is_deleted
    union all
    select 3 as customer_id, 'deleted@example.com' as email, timestamp('2024-01-03') as created_at, true as is_deleted
)

select
    customer_id,
    email{{
  config(
    materialized = 'view'
  )
}}

with raw_customers as (
    select 1 as customer_id, 'alice@example.com' as email, timestamp('2024-01-01') as created_at, false as is_deleted
    union all
    select 2 as customer_id, 'bob@example.com' as email, timestamp('2024-01-02') as created_at, false as is_deleted
    union all
    select 3 as customer_id, 'deleted@example.com' as email, timestamp('2024-01-03') as created_at, true as is_deleted
)

select
    customer_id,
    email
from raw_customers
where is_deleted = false
from raw_customers
where is_deleted = false
from {{ ref('raw_customers') }}
where is_deleted = false