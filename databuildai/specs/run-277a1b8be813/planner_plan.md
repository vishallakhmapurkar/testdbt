### Execution Plan: Create `stg_customers` Staging Model

1. **Pre-check:** Use `search` to ensure `stg_customers` does not already exist in the project.
2. **Develop:** Create `models/staging/stg_customers.sql` as a view that:
   - Selects from `source('raw_crm', 'customers')`.
   - Filters for `is_deleted = false`.
   - Selects only `customer_id`, `email`, `created_at`.
3. **Test/Docs:** Create `models/staging/_staging__models.yml` (or `stg_customers.yml`) to apply `not_null` and `unique` tests to `customer_id` and `not_null` tests to `email` and `created_at`.
4. **Validation:** Run `dbt run --select stg_customers` and `dbt test --select stg_customers` to verify correctness.