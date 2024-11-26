#!/bin/bash

# MySQL connection details
USERNAME="jnash"
PASSWORD="x"
HOST="localhost"

# SQL script file for creating the new table
SQL_SCRIPT=".local/bin/create_project_table.sql"	

# Connect to MySQL and execute the SQL script in the xuuki database
mariadb -u $USERNAME -p$PASSWORD -h $HOST xuuki < $SQL_SCRIPT

