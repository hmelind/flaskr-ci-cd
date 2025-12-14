#!/bin/bash
set -euo pipefail

cd /app/flaskr-devops || exit 1

mkdir -p instance

DB_FILE="instance/flaskr.sqlite"

if [ ! -f "$DB_FILE" ]; then
  echo "Database not found at $DB_FILE. Initializing DB..."
  flask --app flaskr init-db
else
  echo "Database already exists at $DB_FILE"
fi

exec "$@"
