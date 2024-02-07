{% macro convert_to_date_month(date_column) -%}

    DATE_TRUNC('month',{{date_column}})

{%- endmacro %}
