WITH provider AS (
    SELECT * FROM {{ ref('base_provider') }}
),
position AS (
    SELECT * FROM {{ ref('base_position') }}
)
SELECT    provider.provider_id,
          provider.first_name,
          provider.last_name,
          position.position_id,
          position.name AS position_name,
          parent_position.position_id AS parent_position_id,
          parent_position.name AS parent_position_name
FROM      provider
LEFT JOIN position ON position.position_id = provider.position_id
LEFT JOIN position AS parent_position ON parent_position.position_id = position.parent_position_id