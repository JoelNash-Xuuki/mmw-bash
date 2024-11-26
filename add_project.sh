USERNAME="jnash"
PASSWORD="x"
HOST="localhost"
SQL_SCRIPT="add_project.sql"

mariadb -u $USERNAME -p$PASSWORD -h $HOST xuuki < $SQL_SCRIPT
