{{ config(materialized='view') }}

SELECT
    customer_id,
    email,
    created_at
FROM {{ ref('raw_customers') }}
WHERE is_deleted = false
