# Usar una imagen oficial de Ubuntu como base
FROM ubuntu:16.04

# Establecer variables de entorno para suprimir los mensajes interactivos
ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    libpcl-dev \
    libeigen3-dev \
    libboost-all-dev \
    libtiff-dev \
    libgeotiff-dev \
    libproj-dev \
    libgdal-dev \
    libxml2-dev \
    libsqlite3-dev \
    libusb-1.0-0-dev \
    libudev-dev \
    pkg-config \
    libjpeg-turbo8-dev \
    && rm -rf /var/lib/apt/lists/*

# Instalar libLAS desde el código fuente
RUN wget http://download.osgeo.org/liblas/libLAS-1.8.1.tar.bz2 \
    && tar -xjf libLAS-1.8.1.tar.bz2 \
    && cd libLAS-1.8.1 \
    && cmake . -DWITH_GDAL=ON -DWITH_GEOTIFF=ON -DWITH_LASZIP=OFF \
    && make \
    && make install \
    && ldconfig

# Clonar PCL desde la etiqueta pcl-1.7.2
RUN git clone https://github.com/PointCloudLibrary/pcl.git /pcl && \
    cd /pcl && \
    git checkout tags/pcl-1.7.2 && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release ..  && \
    make -j4 && \
    make install && \
    ldconfig

# # Clonar el repositorio GH-ICP
RUN git clone https://github.com/ramiro999/GH-ICP /app

# # Crear el directorio de compilación y compilar el código
WORKDIR /app

RUN apt-get update && apt -y install libgoogle-glog-dev

RUN mkdir build && \
     cd build && \
     cmake .. && \
     make

RUN chmod +x /app/bin/ghicp

# Copiar el script de entrada
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

# Establecer el punto de entrada
ENTRYPOINT ["/entrypoint.sh"]


# Instrucciones para ejecutar el contenedor
# docker build -t gh-icp .
# docker run -v /path/to/data:/app/data gh-icp