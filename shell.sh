#!/bin/bash
# Script para abrir una terminal interactiva dentro del contenedor

docker run -it --rm \
    -v $(pwd)/cloudpoints:/gh_icp/GH-ICP/samples:rw \
    -e DISPLAY \
    --security-opt label=type:container_runtime_t \
    --entrypoint /bin/bash \
    cloudpointgh-icp 
