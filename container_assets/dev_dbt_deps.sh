#!/bin/sh
set -e

echo Running dbt deps for transform

cd /home/local/transform
dbt deps
