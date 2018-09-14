WITH job AS (
    SELECT * FROM {{ ref('base_job')}}
),
provider AS (
    SELECT * FROM {{ ref('dim_provider')}}
),
brand AS (
    SELECT * FROM {{ ref('base_brand')}}
)
SELECT    job.job_id,
          job.title,
          job.approved_date,
          job.open_date,
          job.other_1,
          job.description,
          brand.brand_id,
          brand.code AS brand_code,
          brand.name AS brand_name,
          provider.provider_id,
          request_provider.provider_id AS request_provider_id,
          reports_to_provider.provider_id AS reports_to_provider_id
FROM      job
LEFT JOIN brand ON brand.brand_id = job.brand_id
LEFT JOIN provider ON provider.provider_id = job.provider_id
LEFT JOIN provider request_provider ON request_provider.provider_id = job.request_provider_id
LEFT JOIN provider reports_to_provider ON reports_to_provider.provider_id = job.reports_to_provider_id