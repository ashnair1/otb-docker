# Orfeo ToolBox Docker Images


Repository for building docker images containing [Orfeo ToolBox](https://www.orfeo-toolbox.org/). Each version has its own branch that you can checkout and build from.

<!-- ![Docker Pulls](https://img.shields.io/docker/pulls/ashnair1/otb?label=Docker%20Pulls&logo=docker) -->

| Versions |                                                 Status                                               |      Image Size    |
| -------- | ---------------------------------------------------------------------------------------------------- |--------------|
|  7.0.0   | ![7.0.0](https://github.com/ashnair1/otb-docker/actions/workflows/build.yml/badge.svg?branch=7.0.0)  |   ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/ashnair1/otb/7.0.0-small?label=small&logo=Docker) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/ashnair1/otb/7.0.0-full?label=full&logo=Docker)           |     
|  7.1.0   | ![7.1.0](https://github.com/ashnair1/otb-docker/actions/workflows/build.yml/badge.svg?branch=7.1.0)  |![Docker Image Size (tag)](https://img.shields.io/docker/image-size/ashnair1/otb/7.1.0-small?label=small&logo=Docker) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/ashnair1/otb/7.1.0-full?label=full&logo=Docker)|
|  7.2.0   | ![7.2.0](https://github.com/ashnair1/otb-docker/actions/workflows/build.yml/badge.svg?branch=7.2.0)  |![Docker Image Size (tag)](https://img.shields.io/docker/image-size/ashnair1/otb/7.2.0-small?label=small&logo=Docker) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/ashnair1/otb/7.2.0-full?label=full&logo=Docker)|
|  7.3.0   | ![7.3.0](https://github.com/ashnair1/otb-docker/actions/workflows/build.yml/badge.svg?branch=7.3.0)  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/ashnair1/otb/7.3.0-small?label=small&logo=Docker) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/ashnair1/otb/7.3.0-full?label=full&logo=Docker)|
|  7.4.0   | ![7.4.0](https://github.com/ashnair1/otb-docker/actions/workflows/build.yml/badge.svg?branch=7.4.0)  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/ashnair1/otb/7.4.0-small?label=small&logo=Docker) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/ashnair1/otb/7.4.0-full?label=full&logo=Docker)|
|  8.0.0   | ![8.0.0](https://github.com/ashnair1/otb-docker/actions/workflows/build.yml/badge.svg?branch=8.0.0)  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/ashnair1/otb/8.0.0-small?label=small&logo=Docker) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/ashnair1/otb/8.0.0-full?label=full&logo=Docker)|


### Build

Build an image with a specific version of OTB:

```console
git clone git@github.com:ashnair1/otb-docker.git
cd otb-docker/
git checkout <version>
docker build -f ./Dockerfile --build-arg BASE=osgeo/gdal:ubuntu-small-3.1.3 -t otb:small .
```

It is recommended to use one of the following images as the base image:
- `osgeo/gdal:ubuntu-full-3.1.3`
- `osgeo/gdal:ubuntu-small-3.1.3`

If unspecfied, `ubuntu-small` is used as the base image.

Refer to the documentation [here](https://github.com/OSGeo/gdal/tree/master/docker) to understand the difference.


### Pull from Dockerhub

Pull an image with a specific version of OTB

```console
docker pull ashnair1/otb:7.4.0-small
```


### Run

```console
docker run --rm --env OTB_MAX_RAM_HINT=2048 -v /path/to/local/data:/data otb/7.4.0:latest otbcli_ReadImageInfo -in /data/img.tif
```
