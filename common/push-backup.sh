#!/bin/bash

if [ -z "$S3_BUCKET" ]; then
  echo "S3_BUCKET environment variable is required"
  exit 1
fi

TEMP_DIR="/tmp/s3-push-backup"

mkdir -p "$TEMP_DIR"

TIMESTAMP=$(date +"%Y-%m-%dT%H-%M-%S")
BACKUP_NAME="$MYSQL_DATABASE-backup-$TIMESTAMP"

export MYSQL_PWD=$MYSQL_ROOT_PASSWORD

if mysqldump --default-auth=mysql_native_password -u root -h "$MYSQL_HOST" --all-databases > "$TEMP_DIR/$BACKUP_NAME.sql"; then
  echo "Backup created successfully: $BACKUP_NAME.sql"
  unset MYSQL_PWD
else
  echo "Backup failed!"
  unset MYSQL_PWD
  exit 1
fi

tar -cvf "$TEMP_DIR/$BACKUP_NAME.tar" -C "$TEMP_DIR" "$BACKUP_NAME.sql"

aws s3 cp "$TEMP_DIR/$BACKUP_NAME.tar" "s3://$S3_BUCKET/" --cli-connect-timeout 10 --cli-read-timeout 20

echo "Database backup sent to S3: $BACKUP_NAME.tar"