FROM nvidia/cuda:12.8.1-base-ubuntu22.04

# wildrig needs cudart + libcurl + ca-certs for HTTPS download + TLS pool connections
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      cuda-cudart-12-8 \
      ocl-icd-libopencl1 \
      libcurl4 \
      ca-certificates \
      curl \
      tar \
      gzip && \
    rm -rf /var/lib/apt/lists/*

# bake NVIDIA OpenCL ICD so wildrig finds the GPU even if container runtime
# doesn't auto-mount it (Vast hosts need this; Salad sometimes needs it too)
RUN mkdir -p /etc/OpenCL/vendors && \
    echo libnvidia-opencl.so.1 > /etc/OpenCL/vendors/nvidia.icd

ARG WILDRIG_VERSION=0.48.9
ARG WILDRIG_URL=https://github.com/andru-kun/wildrig-multi/releases/download/0.48.9/wildrig-multi-linux-0.48.9.tar.gz

RUN mkdir -p /opt/wildrig && \
    curl -fsSL "$WILDRIG_URL" | tar -xz -C /opt/wildrig && \
    chmod +x /opt/wildrig/wildrig-multi && \
    /opt/wildrig/wildrig-multi --version || true

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
