WITH dbt_queries AS (
    SELECT * FROM {{ref('dbt_queries')}}
),

max_date AS (
    SELECT MAX(DATE(end_time)) AS date
    FROM dbt_queries
)

SELECT
    dbt_queries.dbt_node_id,
    SUM(dbt_queries.query_cost) AS total_cost_last_30d,
    total_cost_last_30d*12 AS estimated_annual_cost
FROM dbt_queries
CROSS JOIN max_date
WHERE
    dbt_queries.start_time >= DATEADD('day', -30, max_date.date)
    AND dbt_queries.start_time < max_date.date -- don't include partial day of data
GROUP BY dbt_queries.dbt_node_id
ORDER BY total_cost_last_30d DESC
LIMIT 5
