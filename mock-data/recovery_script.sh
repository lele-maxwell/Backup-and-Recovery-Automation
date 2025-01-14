#!/bin/bash
 SOURCE_DIR="/app/mock-data"          
 BACKUP_DIR="/app/backup"            
 TIMESTAMP=$(date +"%Y%m%d_%H%M%S")   
 ARCHIVE_NAME="backup_$TIMESTAMP.tar.gz"

# defining the DIR variable that contains the original directory location of our mock data files
 DIR=$(dirname $SOURCE_DIR)

tar -xzf $BACKUP_DIR/$(ls $BACKUP_DIR) -C $DIR 
