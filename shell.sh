#!/bin/bash
# Script para abrir una terminal interactiva dentro del contenedor

podman run -it --rm \
    -v $(pwd)/cloudpoints:/gh_icp/GH-ICP/samples:rw \
    -e DISPLAY \
    --security-opt label=type:container_runtime_t \
    gh-icp bash
