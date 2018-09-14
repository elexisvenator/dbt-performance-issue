SELECT provider_id,first_name,last_name,position_id
FROM   {{ ref('load_provider') }}