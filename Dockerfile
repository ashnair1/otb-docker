ARG BASE=osgeo/gdal:ubuntu-small-3.1.3
FROM $BASE AS build

LABEL maintainer="ashnair1"
USER root

SHELL [ "/bin/bash", "-c" ]

ENV TARGET=/opt/otb

RUN apt-get update && apt-get -y install python3-distutils wget file
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget -P /opt/ https://www.orfeo-toolbox.org/packages/archives/OTB/OTB-7.2.0-Linux64.run && chmod +x /opt/OTB-7.2.0-Linux64.run
RUN mkdir -p /opt/otb && /opt/OTB-7.2.0-Linux64.run --target ${TARGET} &> /tmp/.otb_build.log
RUN rm /opt/OTB-7.2.0-Linux64.run

FROM ${BASE}

ENV TARGET=/opt/otb
COPY --from=build ${TARGET} ${TARGET}

ENV CMAKE_PREFIX_PATH=${TARGET} \
    PYTHONPATH=${TARGET}/lib/python \
    GDAL_DATA=${TARGET}/share/gdal \
    PROJ_LIB=${TARGET}/share/proj \
    LC_NUMERIC=C \
    OTB_APPLICATION_PATH=${TARGET}/lib/otb/applications \
    PATH=${TARGET}/bin:$PATH
