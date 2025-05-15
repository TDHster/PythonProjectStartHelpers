#!/bin/bash

source ./.deploy_sync.sh

echo "Killing old process..."
ssh "$REMOTE_USER@$REMOTE_HOST" -p "$REMOTE_PORT" "pkill -f $SCRIPT_NAME || true"

echo "Starting bot..."
ssh "$REMOTE_USER@$REMOTE_HOST" -p "$REMOTE_PORT" "cd $REMOTE_PATH && nohup $SCRIPT_NAME > $SCRIPT_NAME.log 2>&1 &"

echo "Program restarted manually via pkill and nohup."
