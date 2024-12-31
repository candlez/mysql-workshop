#!/bin/bash

# ensure that the aws cli is installed
chmod +x /usr/local/bin/install-aws-cli.sh
/usr/local/bin/install-aws-cli.sh

# pull a back up from the bucket
chmod +x /usr/local/bin/pull-backup.sh
/usr/local/bin/pull-backup.sh

# now we go into normal set up of the mysql server
exec /usr/local/bin/docker-entrypoint.sh mysqld