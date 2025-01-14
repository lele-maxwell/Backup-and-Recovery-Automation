export SOURCE_DIR="/app/mock-data"          
export BACKUP_DIR="/app/backup"            
export TIMESTAMP=$(date +"%Y%m%d_%H%M%S")   
export ARCHIVE_NAME="backup_$TIMESTAMP.tar.gz"

mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"
if [[ $? -eq 0 ]]; then
  
    echo "Backup created successfully: $BACKUP_DIR/$ARCHIVE_NAME"
    else
    echo "Backup failed."
    exit 1
fi


