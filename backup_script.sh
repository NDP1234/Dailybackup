#!/bin/bash

# Database credentials
DB_USER="root"
DB_PASS="niravgovtsoft"
DB_NAME="backup_db"

# Backup directory and filename
BACKUP_DIR="/mnt/c/backupFolder"
DATE=$(date +"%d-%m-%Y_%H-%M-%S")
NEW_FILENAME="$BACKUP_DIR/backup_$DATE.sql"

# Check if old backup file exists and delete it
if [ -f "$BACKUP_DIR/backup_"*".sql" ]; then
    echo "Old backup file found. Removing..."
    rm "$BACKUP_DIR/backup_"*".sql"
else
    echo "No old backup file found."
fi

# Create the backup
mysqldump -hlocalhost -u$DB_USER -p$DB_PASS $DB_NAME > $NEW_FILENAME
