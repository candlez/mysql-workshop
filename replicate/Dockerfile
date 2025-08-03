FROM mysql:8.0.35

COPY replicate/custom-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["bash", "/usr/local/bin/custom-entrypoint.sh"]