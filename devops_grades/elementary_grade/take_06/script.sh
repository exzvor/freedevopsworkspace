#!/bin/bash

# Set the following environment variables according to your configuration
DB_USER="postgres"
DB_NAME="db"

# Create a backup file name with the current time
BACKUP_FILE="/home/user/$(date +%H%M%S).sql"

# Command to create a backup of PostgreSQL database
PGPASSFILE=/home/user/.pgpass pg_dump -U $DB_USER -h localhost -d $DB_NAME -f $BACKUP_FILE >> /home/user/log.log 2>&1

#in this case, you can't just run the script with the command ./script.sh
#to do this, replace the first part with PGPASSFILE=~/.pgpass ....

# Checking whether the pg_dump command was successfully executed
if [ $? -eq 0 ]; then
  echo "PostgreSQL database backup successfully created: $BACKUP_FILE"
else
  echo "Error when backing up a PostgreSQL database"
fi
#Make sure you set the path to the .pgpass file correctly in the PGPASSFILE variable and save the changes to the script.
#After that, the task in Cron should run successfully and create a backup of the PostgreSQL database.