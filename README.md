# Orfeo Toolbox v7.2.0

### Build

```console
docker build -f ./Dockerfile --build-arg BASE=osgeo/gdal:ubuntu-small-3.1.3 -t otb/7.2.0:latest .
```
It is recommended to use one of the following images as the base image:
- `osgeo/gdal:ubuntu-full-3.1.3`
- `osgeo/gdal:ubuntu-small-3.1.3`

Refer to the documentation [here](https://github.com/OSGeo/gdal/tree/master/docker) to understand the differences.


### Run

```console
docker run --rm --env OTB_MAX_RAM_HINT=2048 -v /path/to/local/data:/data otb/7.2.0:latest otbcli_ReadImageInfo -in /data/img.tif
```