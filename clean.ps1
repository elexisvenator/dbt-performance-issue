$ErrorActionPreference = "Stop"

Remove-Item -Recurse -Force -ErrorAction Ignore .\transform\logs\
Remove-Item -Recurse -Force -ErrorAction Ignore .\transform\dbt_modules\
Remove-Item -Recurse -Force -ErrorAction Ignore .\transform\target\
