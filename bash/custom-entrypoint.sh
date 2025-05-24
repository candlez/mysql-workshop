#!/bin/bash

# ensure that the aws cli is installed
chmod +x /usr/local/bin/install-aws-cli.sh
/usr/local/bin/install-aws-cli.sh

# pull a backup from the bucket
chmod +x /usr/local/bin/pull-backup.sh
/usr/local/bin/pull-backup.sh

# set up cron jobs for saving backups

chmod +x /usr/local/bin/create-backup.sh
echo "0 * * * * /usr/local/bin/create-backup.sh" | crontab -

# now we go into normal set up of the mysql server
exec /usr/local/bin/docker-entrypoint.sh mysqld