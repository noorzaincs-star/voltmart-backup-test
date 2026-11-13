# VoltMart Electronics Backup and Recovery Test Report

## 1. Project Overview

This project demonstrates a basic backup and recovery process for VoltMart Electronics product data.

## 2. Test Method

The scripts were run on 2026-11-13 in isolated temporary copies of the project, using the existing `products/products.csv`. This avoided changing the project's existing backups and restore files. The temporary test data was removed after verification.

## 3. Backup Test

- Script: `backup.sh`
- Method: timestamped `tar.gz` archive of `products/`
- Result: **PASS**
- Verification: a new timestamped archive was created, `tar` listed `products/products.csv` in the archive, and `backups/backup.log` recorded the archive and its size.

## 4. Restore Test

- Script: `restore.sh`
- Destination: `restore/products/products.csv`
- Result: **PASS**
- Verification: an older archive containing different product data was present; restore used the newly created latest archive.
- The restored file existed and its SHA-256 matched the source file: `BD5243F6A4867B24427489FE2AEFFCC35F167836C94352F06594E9F0F313965E`.
- `backups/restore.log` was generated.

## 5. Final Result

**PASS** — the backup archive was created and readable, restore selected the latest archive, and the restored CSV matched the original. The tests were run on temporary copies; the existing project backup and restore data were left unchanged.

## 6. Screenshot Evidence

The screenshot below is the actual project image and shows a successful backup command. It is included as existing evidence; it was not captured during the isolated validation run above.

![Backup Success](backup_success.png)

## Backup Success Screenshot

The screenshot below shows the successful backup process.

![Backup Success](backup_success.png)
