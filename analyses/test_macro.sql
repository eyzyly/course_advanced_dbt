SELECT
{{rolling_agg_n_periods(agg_type='sum',column_name='cost',partition_by='product_id',order_by='created_at',num_period=7)}}
FROM {{ref('fct_events')}}
