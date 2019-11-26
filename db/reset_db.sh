#!/usr/bin/env bash
s=$BASH_SOURCE ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME="$s"  # get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path

if [[ -z $MYSQL ]]; then MYSQL='MYSQL'; fi

docstring="
MYSQL='docker exec thangtm58_lavarel_start_pg  mysql -uroot -proot' ./db/reset_db.sh
"

DB_USER='root'
DB_PASSWORD=''
DB_NAME='customer'
mysql -e "SELECT 1"  #TODO find the command to close current mysql connection
mysql -e "DROP DATABASE if exists $DB_NAME;"
mysql -e "CREATE DATABASE $DB_NAME;"

# run database file
mysql -u $DB_USER -p $DB_PASSWORD $DB_NAME < "$SCRIPT_HOME/db_seed.sql"
#mysql --host=localhost --port=8080 --user=$DB_USER --password=$DB_PASSWORD $DB_NAME  -e "$SCRIPT_HOME/db_seed.sql"