-- Calculates the rolling average MRR per user using a 6 month period
-- The resulting table allows you to trend MRR by user and identify high risk customers to target for promos

SELECT
    user_id,
    date_month,
    {{rolling_agg_n_periods(agg_type='avg',column_name='mrr_amount',partition_by='user_id',order_by='date_month',num_period=6)}}

FROM {{ref('fct_mrr')}}
ORDER BY
    user_id,
    date_month
