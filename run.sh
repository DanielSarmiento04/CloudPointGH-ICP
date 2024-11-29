#!/bin/bash
# Script para ejecutar el contenedor y correr GH-ICP

# Montar los directorios necesarios y ejecutar el contenedor
docker run -it --rm \
    -e DISPLAY \
    --security-opt label=type:container_runtime_t \
    cloudpointgh-icp /app/samples/bunny/source.pcd /app/samples/bunny/target.pcd /app/samples/bunny/output.pcd
