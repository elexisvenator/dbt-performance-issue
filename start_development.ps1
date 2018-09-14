$ErrorActionPreference = "Stop"

Write-Host "Cleaning old folders." -ForegroundColor  cyan
& .\clean.ps1

Write-Host "Building Data Pipeline." 
docker-compose -f development-docker-compose.yml build

Write-Host "Starting Development Environment."
Write-Host "The first command that you want to run is probably './dev_dbt_deps.sh' " -ForegroundColor Yellow
Write-Host "You can access the db from (by default) '10.0.75.1:5433/dbt' user/pass: 'docker docker' " -ForegroundColor Yellow
docker-compose -f development-docker-compose.yml run data_pipeline bash


