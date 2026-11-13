# VoltMart Electronics Backup and Recovery Test Report

## 1. Project Overview

This project demonstrates a basic backup and recovery process for an Ubuntu system.

The purpose is to protect product data and test whether it can be restored successfully.

## 2. Backup Test

- Backup script: backup.sh
- Backup method: tar.gz compression
- Backup source: products/
- Backup destination: backups/
- Backup archive: products_backup_2026-11-11_04-50-09.tar.gz
- Archive size: 1.0K
- Result: SUCCESS

## 3. Restore Test

- Restore script: restore.sh
- Restore destination: restore/
- Restored file: products/products.csv
- Result: SUCCESS

## 4. Verification

The following checks were completed:

- Backup archive created successfully.
- Restore script extracted the backup.
- products.csv was found in the restored folder.
- Backup and restore logs were generated.

## 5. Final Result

The backup and recovery test was successful.

The products.csv file was backed up and restored successfully.

## 6. Conclusion

This project demonstrates that a simple Bash-based backup and recovery process can help protect important product data.

## 7. Backup Success Screenshot

![Backup Success](backup_success.png)
