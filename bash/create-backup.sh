#!/bin/bash

if [ -z "$S3_BUCKET" ]; then
  echo "S3_BUCKET environment variable is required"
  exit 1
fi

TEMP_DIR="/tmp/s3-push-backup"

mkdir -p $TEMP_DIR

TIMESTAMP=$(date +"%Y-%m-%d")
BACKUP_NAME="$MYSQL_DATABASE-backup-$TIMESTAMP"

if mysqldump -u root -p "$MYSQL_ROOT_PASSWORD" $MYSQL_DATABASE > "$TEMP_DIR/$BACKUP_NAME.sql"; then
  echo "Backup created successfully: $BACKUP_NAME.sql"
else
  echo "Backup failed!"
  exit 1
fi

tar -cvf "$TEMP_DIR/$BACKUP_NAME.tar" -C $TEMP_DIR "$TEMP_DIR/$BACKUP_NAME.sql"

aws s3 cp "$TEMP_DIR/$BACKUP_NAME.tar" s3://$S3_BUCKET/

rm -rf $TEMP_DIR

echo "Database backup sent to S3: $LATEST_BACKUP"