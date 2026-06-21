{{ config(materialized='view') }}

WITH source AS (
    SELECT * FROM {{ source('staging', 'raw_customers') }}
),

renamed AS (
    SELECT
        customer_id,
        email,
        created_at
    FROM source
)

SELECT * FROM renamed
