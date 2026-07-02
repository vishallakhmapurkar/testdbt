### Functional Specification: `stg_customers`

This specification outlines the creation of a staging model `stg_customers` to filter active customers from the raw CRM source.

#### Model Details
- **Name:** `stg_customers`
- **Materialization:** `view`
- **Path:** `models/staging/stg_customers.sql`
- **Source:** `source('raw_crm', 'customers')`
- **Logic:** Filter to active customers where `is_deleted = false`.
- **Output Columns:** `customer_id`, `email`, `created_at`.
- **Primary Key:** `customer_id`.

#### Tests
- `customer_id`: `not_null`, `unique`
- `email`: `not_null`
- `created_at`: `not_null`

#### Decision Log
- Metadata lookup for `stg_customers` identified an existing model with the same name, but its logic appears to reference a hardcoded table `raw_customers` instead of the required `source('raw_crm', 'customers')`. The existing model also failed in its last execution. I am proceeding with the specification as requested to align with the provided source requirement.

### Assumption Policy
- No assumptions are permitted; facts must come from the requirement, mandate, or verified metadata.
- No blocking missing information was identified from the provided inputs.
