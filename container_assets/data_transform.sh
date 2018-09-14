#!/bin/sh
set -e

cd /home/local/transform
dbt seed 
dbt run
dbt test