## Technical Design: `stg_customers`

### Overview
This design implements the `stg_customers` staging model in BigQuery as a view, filtering for active customers based on the requirement to exclude deleted records.

### Model: `stg_customers`
- **File Name:** `models/staging/stg_customers.sql`
- **Materialization:** `view`
- **Grain:** One row per customer (`customer_id`)
- **Dependencies:** `source('raw_crm', 'customers')`
- **SQL Strategy:** Select necessary columns (`customer_id`, `email`, `created_at`) from the source, applying a `WHERE is_deleted = false` filter.
- **Tests:** 
  - `customer_id`: `not_null`, `unique`
  - `email`: `not_null`
  - `created_at`: `not_null`

### Assumption Policy
- No assumptions are permitted; design facts must come from the approved functional spec, mandate, official dbt skills, or verified dbt MCP metadata.
- No blocking missing information was identified for implementation.
