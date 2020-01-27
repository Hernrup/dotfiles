#!/bin/bash
COMMAND=$1
if [ -z "$COMMAND" ]; then
    echo "Usage: $0 <up/down>"
    exit 1
fi

if [ -eq $command 'up']; then
    echo -n "Password mount: "
    read -s PASS
    echo 'connecting'
else
    echo 'Disconnecting'
fi

