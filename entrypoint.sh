#!/bin/bash

# Cambiar al directorio de GH-ICP y ejecutar el script de run.sh
cd /gh_icp/GH-ICP/script

# Definir las rutas de los archivos PCD
source_point_cloud_path="./samples/bunny/source.pcd"
target_point_cloud_path="./samples/bunny/target.pcd"
output_point_cloud_path="./samples/bunny/output.pcd"

# Ejecutar el script con los parámetros configurados
echo "Ejecutando GH-ICP con los siguientes parámetros:"
echo "- source: $source_point_cloud_path"
echo "- target: $target_point_cloud_path"
echo "- output: $output_point_cloud_path"

# Ejecutar run.sh
./run.sh "$target_point_cloud_path" "$source_point_cloud_path" "$output_point_cloud_path"

# Copiar el archivo de salida a la ubicación local para su visualización
cp "$output_point_cloud_path" ./samples/bunny/output_local.pcd
