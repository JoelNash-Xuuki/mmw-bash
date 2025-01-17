USERNAME="jnash"
PASSWORD="x" 
HOST="localhost"
DATABASE="xuuki"

mysql -u $USERNAME -p$PASSWORD -h $HOST xuuki -e "SELECT * FROM projects;"
