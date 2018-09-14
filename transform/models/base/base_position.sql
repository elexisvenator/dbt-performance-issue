-- type conversions are to address issue fixed in https://github.com/fishtown-analytics/dbt/pull/995
SELECT position_id,name,CAST(nullif(parent_position_id, '') AS INTEGER) AS parent_position_id
FROM   {{ ref('load_position') }}