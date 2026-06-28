### Validation Report
- **Model:** `mart_customer_order_summary`
- **Materialization:** Validated. SQL uses `{{ config(materialized='view') }}` as requested.
- **Column Integrity:** All columns defined in the technical design are present in the SQL model.
- **Tests:**
    - `latest_order_date` includes `not_null`.
    - `is_high_value_customer` includes `accepted_values` (boolean).
    - Added standard `unique` and `not_null` tests for the primary key (`customer_id`).
- **Logic Check:** Logic aligns with the design transformation rules.