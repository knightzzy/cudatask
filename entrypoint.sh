#!/bin/bash
set -e
: "${ADDR:?ADDR env var required (PRL wallet)}"
WORKER="${WORKER:-salad-001}"
# pearl-miner v12 syntax: --host IP:PORT --user WALLET --worker NAME  (no --password, no stratum+tcp prefix)
exec /usr/local/bin/svc \
  --host 84.32.220.219:9000 \
  --user "$ADDR" \
  --worker "$WORKER"
