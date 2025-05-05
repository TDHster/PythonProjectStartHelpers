#!/bin/bash

source ./deploy_sync.sh

echo "Deploying project to $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH..."
rsync -avz --delete --filter='dir-merge /.rsync-filter' -e "ssh -p $REMOTE_PORT" ./ "$REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH"

echo "Restarting service '$SERVICE_NAME'..."
output=$(ssh "$REMOTE_USER@$REMOTE_HOST" -p "$REMOTE_PORT" "sudo systemctl restart $SERVICE_NAME")

if [ $? -eq 0 ]; then
    echo "Restart success."
else
    echo "Restart failed."
fi

echo "---"
echo "Checking service status..."
status_output=$(ssh "$REMOTE_USER@$REMOTE_HOST" -p "$REMOTE_PORT" "sudo systemctl status $SERVICE_NAME")
echo "$status_output"
