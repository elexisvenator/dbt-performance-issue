FROM postgres:10

COPY docker-entrypoint-initdb.d/ /docker-entrypoint-initdb.d/

RUN chmod +x /docker-entrypoint-initdb.d/init.sh && \
    chmod +x /docker-entrypoint-initdb.d/init.sql
