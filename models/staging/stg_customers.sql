{{ config(materialized='view') }}

select
    customer_id,
    email
from {{ ref('raw_customers') }}
where is_deleted = false
