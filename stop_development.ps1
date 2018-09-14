$ErrorActionPreference = "Stop"

Write-Host "Stopping development environment" -ForegroundColor  cyan

docker-compose -f development-docker-compose.yml down


