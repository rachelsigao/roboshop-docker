#!/bin/bash

# Check if the password file exists (written by the init container from AWS Secrets Manager)
if [ -f /tmp/mysql_root_password.txt ]; then
    # Read the MySQL root password from the file into a variable
    PASSWORD=$(cat /tmp/mysql_root_password.txt)
    echo "Accessed Root password"
else
    # If the file is missing, the init container likely failed — abort startup
    echo "Password file not found"
    exit 1
fi

# Export the password as an environment variable so MySQL's entrypoint can pick it up
export MYSQL_ROOT_PASSWORD=$PASSWORD

# Delete the plain-text password file for security (avoid leaving secrets on disk)
rm -rf /tmp/mysql_root_password.txt

# Hand off to the official MySQL entrypoint script to start the mysqld process
exec /entrypoint.sh mysqld