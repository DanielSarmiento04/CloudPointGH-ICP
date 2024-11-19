#!/bin/bash
# Script para ejecutar el contenedor y correr GH-ICP

# Montar los directorios necesarios y ejecutar el contenedor
podman run -it --rm \
    -v $(pwd)/cloudpoints:/gh_icp/GH-ICP/samples:rw \
    -e DISPLAY \
    --security-opt label=type:container_runtime_t \
    gh-icp /gh_icp/GH-ICP/samples/bunny/source.pcd /gh_icp/GH-ICP/samples/bunny/target.pcd
