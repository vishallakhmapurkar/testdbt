### Validation Report

**Model:** `stg_customers`
- **Configuration:** Materialized as `view`. Matches technical design.
- **Schema Definition:** Successfully mapped columns `customer_id` and `created_at` to the required tests (unique, not_null) as specified in the technical design.
- **SQL Integrity:** The model implementation correctly uses a CTE (`raw_customers`) and includes all columns required by the technical design.
- **Source Usage:** The model correctly uses `{{ source('raw', 'customers') }}` (two arguments), complying with the requirement to avoid one-argument source macros.