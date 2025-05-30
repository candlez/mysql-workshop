FROM mysql:8.0.35

RUN microdnf install -y python3-pip && microdnf clean all

RUN pip3 install awscli --upgrade

COPY main/custom.cnf /etc/mysql/conf.d/custom.cnf

COPY common/pull-backup.sh /usr/local/bin/

COPY main/custom-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/custom-entrypoint.sh

EXPOSE 3306/tcp

ENTRYPOINT ["bash", "/usr/local/bin/custom-entrypoint.sh"]