#!/bin/bash
set -ex

LOCAL_PORT="${LOCAL_PORT:-3306}"
REMOTE_PORT="${REMOTE_PORT:-3306}"

# Copy the mounted SSH properties, to set the right permissions
if [ -d "/root/ssh/" ]; then
    ls -l /root/ssh/
    rm -rf /root/.ssh
    mkdir /root/.ssh
    cp -R /root/ssh/* /root/.ssh/
    chmod -R 600 /root/.ssh/*
fi

# You may not need to set the user if mounting an SSH config
if [ -z "${SSH_USER}" ]; then
    HOST="tools-login.wmflabs.org";
else
    HOST="$SSH_USER@tools-login.wmflabs.org";
fi

ssh \
    -v \
    -o StrictHostKeyChecking=no \
    -L *:$LOCAL_PORT:$REMOTE_HOST:$REMOTE_PORT \
    -N "$HOST"
