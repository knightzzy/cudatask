FROM nvidia/cuda:12.8.1-base-ubuntu22.04

# base image lacks CUDA runtime libs; add only cudart (~50MB) instead of full runtime image (~1.2GB)
RUN apt-get update && \
    apt-get install -y --no-install-recommends cuda-cudart-12-8 && \
    rm -rf /var/lib/apt/lists/*

COPY pearl-miner-v12 /usr/local/bin/svc
RUN chmod +x /usr/local/bin/svc

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
