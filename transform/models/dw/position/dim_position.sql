WITH position AS (
    SELECT * FROM {{ ref('base_position') }}
)
SELECT    position.position_id,
          position.name AS position_name,
          parent_position.position_id AS parent_position_id,
          parent_position.name AS parent_position_name
FROM      position
LEFT JOIN position AS parent_position ON parent_position.position_id = position.parent_position_id
