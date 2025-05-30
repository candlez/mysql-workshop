FROM mysql:8.0.35

RUN microdnf install -y python3-pip && microdnf clean all

RUN pip3 install awscli --upgrade

COPY common/push-backup.sh /usr/local/bin/

COPY backup/custom-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["bash", "/usr/local/bin/custom-entrypoint.sh"]