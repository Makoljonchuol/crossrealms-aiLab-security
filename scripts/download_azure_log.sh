#!/bin/zsh
# Script to download cowrie.json from Azure honeypot VM with a unique name for each day

# --- EDIT THESE VARIABLES ---
REMOTE_USER="trapmaster"           # My VM username
REMOTE_HOST="40.75.122.16"         # My VM hostname or IP
REMOTE_PATH="/home/trapmaster/tpotce/data/cowrie/log/cowrie.json"  # Path to cowrie.json on VM
LOCAL_DIR="$(cd "$(dirname "$0")/.." && pwd)/data/azure"  # Local destination directory (relative to project root)
# ----------------------------

DATE=$(date +%Y-%m-%d)
scp -P 64295 "$REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH" "$LOCAL_DIR/cowrie_$DATE.json"

##./scripts/download_azure_log.sh