FROM nvidia/cuda:12.8.1-runtime-ubuntu22.04

# pearl-miner v12 baked from local copy (avoids GA -> pearlhash CF block at build time)
COPY pearl-miner-v12 /usr/local/bin/svc
RUN chmod +x /usr/local/bin/svc

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
