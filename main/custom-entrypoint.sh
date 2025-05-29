#!/bin/bash

# pull a backup from the bucket
chmod +x /usr/local/bin/pull-backup.sh
/usr/local/bin/pull-backup.sh

# now we go into normal set up of the mysql server
exec /usr/local/bin/docker-entrypoint.sh mysqld