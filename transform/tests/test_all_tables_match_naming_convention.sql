{#/* Execute the test */#}
{{ pageup_dbt_utils.tables_that_dont_match_naming_convention() }}

{#/* This part logs any results in the console */#}
{%- call statement('tables_that_dont_match_naming_convention', fetch_result=True) -%} 
    {{ pageup_dbt_utils.tables_that_dont_match_naming_convention() }}
{%- endcall -%} 

{%- set results = load_result('tables_that_dont_match_naming_convention')['data'] | map(attribute=0) -%} 

{% for result in results %}
    {% if loop.first %}
        {{ log("Test failed due to table name(s) not matching naming convention:", info=True) }}
    {% endif %}
    
    {{ log("  - " ~ result, info=True) }}
{% endfor %}