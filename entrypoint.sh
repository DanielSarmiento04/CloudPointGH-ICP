#!/bin/bash


#data path
target_point_cloud_path=$1;
source_point_cloud_path=$2;
output_point_cloud_path=$3;

#parameters
using_feature=B;              # Feature selection [ B: BSC, F: FPFH, R: RoPS, N: register without feature ]
corres_estimation_method=N;   # Correspondence estimation by [ K: Bipartite graph min weight match using KM, N: Nearest Neighbor, R: Reciprocal NN ]

downsample_resolution=0.1;    # Raw data downsampling voxel size, just keep one point in the voxel  
neighborhood_radius=0.5;      # Curvature estimation / feature encoding radius
curvature_non_max_radius=1.0; # Keypoint extraction based on curvature: non max suppression radius 
weight_adjustment_ratio=1.1;  # Weight would be adjusted if the IoU between expected value and calculated value is beyond this value
weight_adjustment_step=0.1;   # Weight adjustment for one iteration
registration_dof=6;           # Degree of freedom of the transformation [ 4: TLS with leveling, 6: arbitary ]
appro_overlap_ratio=0.5;      # Estimated approximate overlapping ratio of two point cloud 

launch_realtime_viewer=1;     # Launch the realtime registration viewer during registration or not (1: Launch, 0: Not launch)

# Ejecutar el script con los parámetros configurados
echo -e "Ejecutando GH-ICP con los siguientes parámetros:\n"
echo -e "\t* Punto de nube objetivo: ${target_point_cloud_path}"
echo -e "\t* Punto de nube fuente: ${source_point_cloud_path}"
echo -e "\t* Punto de nube de salida: ${output_point_cloud_path}"
echo -e "\t* Usando característica: ${using_feature}"
echo -e "\t* Método de estimación de correspondencia: ${corres_estimation_method}"
echo -e "\t* Resolución de muestreo: ${downsample_resolution}"
echo -e "\t* Radio de vecindad: ${neighborhood_radius}"
echo -e "\t* Radio de no máxima supresión de curvatura: ${curvature_non_max_radius}"
echo -e "\t* Relación de ajuste de peso: ${weight_adjustment_ratio}"
echo -e "\t* Paso de ajuste de peso: ${weight_adjustment_step}"
echo -e "\t* Grados de libertad de registro: ${registration_dof}"
echo -e "\t* Relación de superposición aproximada: ${appro_overlap_ratio}"
echo -e "\t* Lanzar visor en tiempo real: ${launch_realtime_viewer}"


/app/bin/ghicp ${target_point_cloud_path} ${source_point_cloud_path} ${output_point_cloud_path} \
${using_feature} ${corres_estimation_method} \
${downsample_resolution} ${neighborhood_radius} ${curvature_non_max_radius} \
${weight_adjustment_ratio} ${weight_adjustment_step} ${registration_dof} ${appro_overlap_ratio} ${launch_realtime_viewer}