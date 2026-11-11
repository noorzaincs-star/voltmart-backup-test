#!/bin/bash

# Project directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source and backup directories
SOURCE_DIR="$SCRIPT_DIR/products"
BACKUP_DIR="$SCRIPT_DIR/backups"
LOG_FILE="$BACKUP_DIR/backup.log"

# Create backup directory if it does not exist
mkdir -p "$BACKUP_DIR"

# Timestamp for backup filename
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVE="$BACKUP_DIR/products_backup_$TIMESTAMP.tar.gz"

# Log backup start
echo "Backup started at: $(date)" >> "$LOG_FILE"

# Check source directory
if [ ! -d "$SOURCE_DIR" ]; then
    echo "ERROR: Products directory not found!" | tee -a "$LOG_FILE"
    exit 1
fi

# Create compressed backup
if tar -czf "$ARCHIVE" -C "$SCRIPT_DIR" products; then
    SIZE=$(du -h "$ARCHIVE" | cut -f1)
    echo "Backup completed successfully." | tee -a "$LOG_FILE"
    echo "Archive: $ARCHIVE" | tee -a "$LOG_FILE"
    echo "Archive size: $SIZE" | tee -a "$LOG_FILE"
else
    echo "ERROR: Backup failed!" | tee -a "$LOG_FILE"
    exit 1
fi

# Log backup end
echo "Backup ended at: $(date)" >> "$LOG_FILE"
