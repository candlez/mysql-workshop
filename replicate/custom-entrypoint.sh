#!/bin/bash

export MYSQL_PWD="$MYSQL_PASSWORD"

if mysqldump -h "$MYSQL_HOST" -u "$MYSQL_USERNAME" "$SOURCE_DB" | \
    mysql -h "$MYSQL_HOST" -u "$MYSQL_USERNAME" "$TARGET_DB"; then
    echo "Data in $SOURCE_DB successfully copied to $TARGET_DB"
    unset MYSQL_PWD
else
    echo "Data replication failed"
    unset MYSQL_PWD
    exit 1
fi


