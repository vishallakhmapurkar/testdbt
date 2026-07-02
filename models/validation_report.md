### Validation Report

- **Model**: `stg_customers`
- **Materialization**: Confirmed as `view` in SQL config (`{{ config(materialized='view') }}`). Matches technical design.
- **SQL Strategy**: Matches design requirement (`SELECT customer_id, email, created_at FROM {{ source('raw_crm', 'customers') }} WHERE is_deleted = false`).
- **Columns**: All required columns (`customer_id`, `email`, `created_at`) are present.
- **Tests**: All tests defined in the technical design have been implemented in the schema YAML.