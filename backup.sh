#!/bin/bash

BACKUP_SRC=$1
BACKUP_DEST=$2
LOG_FILE="backup.log"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
UUID=$(date +%s%N | md5sum | head -c 8)
BACKUP_NAME="backup_$TIMESTAMP-$UUID.tar.gz"
LOG_TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
LOG_PREFIX="[$LOG_TIMESTAMP] [$(whoami)]:"

if ! test -e $BACKUP_SRC; then
        echo "no such directory"
        echo "$LOG_PREFIX no such file or directory" >>$LOG_FILE
        exit 1
fi

tar -czf $BACKUP_DEST/$BACKUP_NAME $BACKUP_SRC 2>>$LOG_FILE 

if [ $? -eq 0 ]; then
    echo "Backup completed successfully."
    echo "$LOG_PREFIX Backup of $BACKUP_SRC to $BACKUP_DEST/$BACKUP_NAME COMPLETED." >>$LOG_FILE
else
    echo "Backup failed. Check the log file for details."
    echo "$LOG_PREFIX Backup of $BACKUP_SRC to $BACKUP_DEST/$BACKUP_NAME failed." >>$LOG_FILE
    exit 1
fi

BACKUP_SIZE=$(du -sh $BACKUP_DEST/$BACKUP_NAME | cut -f1)
echo "Backup Size: $BACKUP_SIZE"
