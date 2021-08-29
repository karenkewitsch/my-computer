#!/usr/bin/env zsh
target_env="${1:-dev}"
echo "setting up databricks-connect to use $target_env"

filename=".databricks-connect"

cp "$home$filename-$target_env" ~/$filename

host=$(cat "$home$filename" | jq '.host')
token=$(cat "$home$filename" | jq '.token')
export DATABRICKS_HOST="$host"
export DATABRICKS_TOKEN="$token"