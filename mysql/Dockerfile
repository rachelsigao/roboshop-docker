# FROM mysql:8.0
# ENV MYSQL_ROOT_PASSWORD=RoboShop@1
# COPY db/* /docker-entrypoint-initdb.d/

# For Mysql to read the password from AWS Secrets Manager, we need to use an init container to fetch the secret and store it in a file that MySQL can read. The entrypoint script will then read the password from that file and set it as the root password for MySQL.
FROM mysql:8.0
COPY db/* /docker-entrypoint-initdb.d/
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]