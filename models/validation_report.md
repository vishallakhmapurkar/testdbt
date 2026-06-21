### Validation Report

- **Model**: `stg_customers`
- **Materialization**: Verified. SQL contains `{{ config(materialized='view') }}` which matches the design requirement.
- **Columns**: Verified. The model includes `customer_id`, `email`, and `created_at` as required.
- **Tests**: Schema YAML includes `unique` and `not_null` for `customer_id` (implied best practice for a primary key) and `not_null` for `created_at` as specified in the design.
- **Source Usage**: Verified. The model uses `{{ source('raw', 'customers') }}` which is valid.