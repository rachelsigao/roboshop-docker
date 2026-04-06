#FROM mysql:8.0
#ENV MYSQL_ROOT_PASSWORD=RoboShop@1
#COPY db/* /docker-entrypoint-initdb.d/

FROM mysql:8.0
COPY db/* /docker-entrypoint-initdb.d/
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]