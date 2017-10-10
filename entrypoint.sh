#!/usr/bin/env bash

CHROMECMD="/usr/bin/google-chrome-stable \
--no-first-run \
--disable-extensions  \
--disable-gpu \
--headless \
--remote-debugging-address=0.0.0.0 \
--remote-debugging-port=9222 \
--user-data-dir=$DATADIR"

until $($CHROMECMD); do
    echo "Chrome crashed with exit code $?. Respawning.." >&2
    sleep 1
done
