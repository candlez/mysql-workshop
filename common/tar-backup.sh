#!/bin/bash

SQL_DUMP=$1
BACKUP_NAME=$(echo "$SQL_DUMP" | sed 's/\([^.]*\).*/\1/')

tar -cvf "$BACKUP_NAME.tar" $SQL_DUMP