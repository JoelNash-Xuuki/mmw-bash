#!/bin/bash

# MySQL connection details
USERNAME="jnash"
PASSWORD="x"
HOST="localhost"

# Connect to MySQL and display the list of tables in the xuuki database
mariadb -u $USERNAME -p$PASSWORD -h $HOST $1 <<EOF
SHOW TABLES;
EOF
