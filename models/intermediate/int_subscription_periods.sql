{% set import_subscriptions = unit_testing_select_table(ref('dim_subscriptions'), ref('unit_test_input_dim_subscriptions')) %}
{% set import_dates = unit_testing_select_table(ref('int_dates'), ref('unit_test_input_int_dates')) %}

-- Get raw monthly subscriptions
    WITH monthly_subscriptions AS (
    SELECT
        subscription_id,
        user_id,
        starts_at,
        ends_at,
        plan_name,
        pricing,
        DATE({{ convert_to_date_month('starts_at') }}) AS start_month,
        DATE({{ convert_to_date_month('ends_at') }}) AS end_month
    FROM
        {{ import_subscriptions }}
    WHERE
        billing_period = 'monthly'
    )

-- Create subscription period start_month and end_month ranges
    SELECT
        subscription_id,
        user_id,
        plan_name,
        pricing AS monthly_amount,
        starts_at,
        ends_at,
        start_month,

        -- For users that cancel in the first month, set their end_month to next month because the subscription remains active until the end of the first month
        -- For users who haven't ended their subscription yet (end_month is NULL) set the end_month to one month from the current date (these rows will be removed from the final CTE)
        CASE
            WHEN start_month = end_month THEN DATEADD('month', 1, end_month)
            WHEN end_month IS NULL THEN DATE(DATEADD('month', 1, {{ convert_to_date_month('CURRENT_DATE') }}))
            ELSE end_month
        END AS end_month
    FROM
        monthly_subscriptions
