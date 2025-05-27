FROM mysql:8.0.35

EXPOSE 3306/tcp

COPY main/custom.cnf /etc/mysql/conf.d/custom.cnf

COPY common/install-aws-cli.sh /usr/local/bin/
COPY common/pull-backup.sh /usr/local/bin/

COPY main/custom-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["bash", "/usr/local/bin/custom-entrypoint.sh"]