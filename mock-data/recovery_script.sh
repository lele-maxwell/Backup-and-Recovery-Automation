#!/bin/bash

# defining the DIR variable that contains the original directory location of our mock data files
export DIR=$(dirname $SOURCE_DIR)

tar -xzf $BACKUP_DIR/$ARCHIVE_NAME -C $DIR 
