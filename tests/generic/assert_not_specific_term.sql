{% test assert_not_specific_term(model, column_name, term) %}

SELECT *
    FROM {{ model }}
    WHERE lower({{ column_name }}) LIKE '%{{ term }}%'

{% endtest %}
