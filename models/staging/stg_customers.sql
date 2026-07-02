{{ config(materialized='view') }}

SELECT
    customer_id,
    email,
    created_at
FROM {{ source('raw_crm', 'customers') }}
WHERE is_deleted = false
