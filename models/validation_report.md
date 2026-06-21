### Validation Report

- **Model**: `stg_customers`
- **Status**: Passed
- **Materialization**: Correctly configured as `view`.
- **Tests**: `unique` and `not_null` tests correctly implemented for `customer_id` as specified in technical design.
- **Logic**: The SQL follows the design strategy of selecting `customer_id`, `email`, and `created_at` from the source.