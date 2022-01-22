# Orfeo Toolbox Docker Images

Repository for building docker images containing [Orfeo Toolbox](https://www.orfeo-toolbox.org/). Each version has its own branch that you can checkout and build from.


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
docker pull ashnair1/otb/7.4.0:latest
```


### Run

```console
docker run --rm --env OTB_MAX_RAM_HINT=2048 -v /path/to/local/data:/data otb/7.4.0:latest otbcli_ReadImageInfo -in /data/img.tif
```