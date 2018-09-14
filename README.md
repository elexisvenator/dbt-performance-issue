# dbt-performance-issue

## Requirements

Docker

## To run (in windows)

* run `.\start_development.ps1`
* in docker shell, run `./dev_dbt_deps.sh`
* in docker shell, run `./data_transform.sh`

This will run dbt seed, run and test. Seed and run will execute very slowly without concurrency. Test will perform as expected.

To clean the active containers, run `.\stop_development.ps1`
