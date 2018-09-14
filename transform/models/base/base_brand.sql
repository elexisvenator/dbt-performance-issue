SELECT brand_id,name,code
FROM   {{ ref('load_brand') }}