#!/bin/bash
set -e
: "${ADDR:?ADDR env var required (PRL wallet)}"
WORKER="${WORKER:-test-001}"
POOL_HOST="${POOL_HOST:-84.32.220.219}"
POOL_PORT="${POOL_PORT:-9000}"
ALGO="${ALGO:-pearlhash}"

# wildrig standard CLI: --algo <name> --url stratum+tcp://<host>:<port> --user WALLET.WORKER --pass x
exec /opt/wildrig/wildrig-multi \
  --algo "$ALGO" \
  --url "stratum+tcp://${POOL_HOST}:${POOL_PORT}" \
  --user "${ADDR}.${WORKER}" \
  --pass x \
  --print-full \
  --no-color \
  --no-watchdog
