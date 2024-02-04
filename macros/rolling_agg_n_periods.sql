{% macro rolling_agg_n_periods(agg_type, column_name, partition_by,order_by, num_period) %}
    {{agg_type}}( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{num_period - 1}} PRECEDING AND CURRENT ROW
            ) AS {{agg_type}}_{{num_period}}_periods_{{ column_name }}
{% endmacro %}
