#!/bin/bash
set -eu

SSHPATH="$HOME/.ssh"
mkdir -p "$SSHPATH"
echo "$DEPLOY_KEY" > "$SSHPATH/key"
chmod 600 "$SSHPATH/key"
SERVER_DEPLOY_STRING="$USERNAME@$SERVER_IP:$SERVER_DESTINATION"
sh -c "rsync $ARGS -e 'ssh -v -i $SSHPATH/key -o StrictHostKeyChecking=no -p $SERVER_PORT' --rsync-path="sudo rsync" $GITHUB_WORKSPACE/$FOLDER $SERVER_DEPLOY_STRING"