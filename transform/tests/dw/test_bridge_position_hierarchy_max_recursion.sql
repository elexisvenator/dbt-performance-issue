SELECT 1
FROM   {{ ref('bridge_position_hierarchy') }}
WHERE  levels_apart > CAST({{ var("max_recursions") }} AS INTEGER)
LIMIT  1