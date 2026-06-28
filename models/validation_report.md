### Validation Report

- **Model**: `stg_customers`
- **Status**: Passed
- **Details**:
    - Materialization: Confirmed as `view`, matching technical design.
    - Tests: `unique` and `not_null` configured for `customer_id`, `not_null` for `email` and `created_at` as per design.
    - SQL Structure: Correctly filters `is_deleted = false` and uses `{{ ref() }}` macro for source.
    - No fix requests needed.