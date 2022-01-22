# Orfeo Toolbox Docker images

### Build

```console
docker build -f ./Dockerfile --build-arg BASE=osgeo/gdal:ubuntu-small-3.1.3 -t otb:7.2.0small .
```
It is recommended to use one of the following images as the base image:
- `osgeo/gdal:ubuntu-full-3.1.3`
- `osgeo/gdal:ubuntu-small-3.1.3`

Refer to the documentation [here](https://github.com/OSGeo/gdal/tree/master/docker) to understand the differences.


### Run

```console
docker run --rm --env OTB_MAX_RAM_HINT=2048 -v /path/to/local/data:/data otb:7.2.0S otbcli_ReadImageInfo -in /data/img.tif
```

### Use other versions

To use alternate versions of OTB some changes need to be made to the Dockerfile. Note that is repo only aims to support OTB>=7.0.0

1. Replace version string
2. If using the latest version, change path to run file. 

For example, the `.run` file of `7.2.0` is located in `https://www.orfeo-toolbox.org/packages/archives/OTB/OTB-7.2.0-Linux64.run` whereas the latest version (currently `7.4.0`) is `https://www.orfeo-toolbox.org/OTB/OTB-7.4.0-Linux64.run`.