FROM mysql:8.0.35

EXPOSE 3306/tcp

COPY main/custom.cnf /etc/mysql/conf.d/custom.cnf

RUN microdnf install -y unzip && microdnf clean all
RUN curl -s "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "/tmp/awscliv2.zip" && \
    unzip -qq /tmp/awscliv2.zip -d /tmp && \
    /tmp/aws/install && \
    rm -rf /tmp/awscliv2.zip /tmp/aws

COPY common/pull-backup.sh /usr/local/bin/

COPY main/custom-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["bash", "/usr/local/bin/custom-entrypoint.sh"]