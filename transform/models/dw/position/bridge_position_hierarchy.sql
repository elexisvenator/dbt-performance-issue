WITH RECURSIVE position AS (
    SELECT * FROM {{ ref('base_position') }}
),
hierarchy_bridge AS (
    SELECT     position.position_id AS position_id,
               position.position_id AS parent_position_id,  {# Gets its own position #}
               0 AS levels_apart
    FROM       position
    UNION ALL
    SELECT     hierarchy_bridge.position_id,
               position.parent_position_id,
               hierarchy_bridge.levels_apart + 1 AS levels_apart 
    FROM       hierarchy_bridge
    INNER JOIN position ON hierarchy_bridge.parent_position_id = position.position_id
    WHERE      position.parent_position_id IS NOT NULL
      AND      hierarchy_bridge.position_id <> position.parent_position_id
      AND      levels_apart < {{ var("max_recursions") }}
)
SELECT   hierarchy_bridge.parent_position_id AS superior_position_id,
         hierarchy_bridge.position_id AS subordinate_position_id,
         min(hierarchy_bridge.levels_apart) AS levels_apart
FROM     hierarchy_bridge
GROUP BY hierarchy_bridge.parent_position_id,
         hierarchy_bridge.position_id
ORDER BY superior_position_id,
         subordinate_position_id,
         levels_apart