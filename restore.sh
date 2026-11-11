#!/bin/bash

# Project directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Backup and restore directories
BACKUP_DIR="$SCRIPT_DIR/backups"
RESTORE_DIR="$SCRIPT_DIR/restore"
LOG_FILE="$BACKUP_DIR/restore.log"

# Create restore directory
mkdir -p "$RESTORE_DIR"

echo "Restore started at: $(date)" | tee -a "$LOG_FILE"

# Find latest backup archive
LATEST_BACKUP=$(ls -t "$BACKUP_DIR"/*.tar.gz 2>/dev/null | head -n 1)

if [ -z "$LATEST_BACKUP" ]; then
    echo "ERROR: No backup archive found!" | tee -a "$LOG_FILE"
    exit 1
fi

# Extract backup
if tar -xzf "$LATEST_BACKUP" -C "$RESTORE_DIR"; then
    echo "Restore completed successfully." | tee -a "$LOG_FILE"
else
    echo "ERROR: Restore failed!" | tee -a "$LOG_FILE"
    exit 1
fi

# Verify restored products.csv
if [ -f "$RESTORE_DIR/products/products.csv" ]; then
    echo "Verification successful: products.csv found." | tee -a "$LOG_FILE"
else
    echo "ERROR: products.csv not found after restore!" | tee -a "$LOG_FILE"
    exit 1
fi

echo "Restore ended at: $(date)" | tee -a "$LOG_FILE"
