#!/bin/bash

# requires "$S3_BUCKET" to be set

if [ -z "$S3_BUCKET" ]; then
  echo "S3_BUCKET environment variable is required"
  exit 1
fi

TEMP_DIR="/tmp/s3-pull-backup"

mkdir -p $TEMP_DIR

LATEST_BACKUP=$(aws s3 ls s3://$S3_BUCKET/ | sort | tail -n 1 | awk '{print $4}')

if [ -z "$LATEST_BACKUP" ]; then
  echo "No backup found in the S3 bucket."
  exit 1
fi

aws s3 cp "s3://$S3_BUCKET/$LATEST_BACKUP" "$TEMP_DIR/$LATEST_BACKUP"

tar -xvf "$TEMP_DIR/$LATEST_BACKUP" -C $TEMP_DIR

BACKUP_BASE=$(echo "$LATEST_BACKUP" | sed 's/\([^.]*\).*/\1/')

mv "$TEMP_DIR/$BACKUP_BASE.sql" "/docker-entrypoint-initdb.d"

rm -rf $TEMP_DIR

echo "Database initialized with backup: $LATEST_BACKUP"