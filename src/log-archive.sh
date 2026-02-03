#!/bin/bash

# ===============================
# Log Archive Tool
# ===============================

# Check argument
if [ -z "$1" ]; then
    echo "Usage: log-archive <log-directory>"
    exit 1
fi

LOG_DIR="$1"
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ARCHIVE_DIR="$PROJECT_ROOT/archives"
LOG_FILE="$ARCHIVE_DIR/archive.log"

# Validate directory
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Log directory does not exist."
    exit 1
fi

# Create archive directory
mkdir -p "$ARCHIVE_DIR"

# Timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"

# Create archive
tar -czf "$ARCHIVE_DIR/$ARCHIVE_NAME" "$LOG_DIR"

# Log activity
echo "[$(date)] Archived $LOG_DIR → $ARCHIVE_NAME" >> "$LOG_FILE"

echo "✅ Logs archived successfully"
echo "📦 Archive stored at: $ARCHIVE_DIR/$ARCHIVE_NAME"
