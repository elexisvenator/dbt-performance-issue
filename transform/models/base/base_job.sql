SELECT job_id,title,approved_date,open_date,other_1,brand_id,description,provider_id,request_provider_id,reports_to_provider_id
FROM   {{ ref('load_job') }}