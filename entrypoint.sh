#!/bin/bash
set -e
: "${ADDR:?ADDR env var required (PRL wallet)}"
WORKER="${WORKER:-salad-001}"
exec /usr/local/bin/svc \
  --pool stratum+tcp://us2.alphapool.tech:5566 \
  --address "$ADDR" \
  --worker "$WORKER" \
  --password x
