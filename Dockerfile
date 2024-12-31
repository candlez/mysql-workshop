FROM mysql:8.0

# we want to grab the latest backup, untar it, and mount it as a volume

# we also want to set up a cron job that backs up the data

EXPOSE 3306/tcp

# custom entrypoint allows us to determine what happens before it's run

COPY bash/* /usr/local/bin/

RUN chmod +x /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["custom-entrypoint.sh"]