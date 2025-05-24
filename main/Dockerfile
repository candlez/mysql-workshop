FROM mysql/mysql-server:8.0-aarch64

EXPOSE 3306/tcp

COPY common/install-aws-cli.sh /usr/local/bin/
COPY common/pull-backup.sh /usr/local/bin/

COPY main/custom-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/custom-entrypoint.sh"]