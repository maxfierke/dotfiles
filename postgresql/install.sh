#!/usr/bin/env bash

set -e

# Ensure createdb exists, or exit otherwise
command -v createdb >/dev/null 2>&1 || exit

# Create. That. DB!
if [ "$(psql -tAc "SELECT 1 FROM pg_database WHERE datname='$USER'")" != '1' ]; then
    createdb -e
fi

