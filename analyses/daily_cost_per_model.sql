WITH dbt_queries AS (
    SELECT * FROM {{ref('dbt_queries')}}
)


SELECT
    DATE(start_time) AS date,
    SUM(query_cost) AS cost
FROM dbt_queries
WHERE dbt_node_id LIKE 'model%'
GROUP BY 1
ORDER BY 1 DESC
