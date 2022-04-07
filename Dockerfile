ARG BASE=osgeo/gdal:ubuntu-small-3.1.3
FROM $BASE AS build

LABEL maintainer="ashnair1"
USER root

SHELL [ "/bin/bash", "-c" ]

ENV TARGET=/opt/otb

RUN : \
    && apt-get update \
    # Required packages to extract OTB from the archive
    && apt-get install -y --no-install-recommends wget file python3 python3-dev python3-numpy \
    # Required packages to run OTB GUI tools AND recompile the Python bindings
    && apt-get install -y --no-install-recommends '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev \
    # Required tools to recompile the bindings
    && apt-get install -y --no-install-recommends g++-7 cmake make \
    # Clean up
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && :

# Download OTB
RUN wget -P /opt/ https://www.orfeo-toolbox.org/packages/archives/OTB/OTB-7.0.0-Linux64.run && chmod +x /opt/OTB-7.0.0-Linux64.run
RUN : \
    mkdir -p ${TARGET} \
    && /opt/OTB-7.0.0-Linux64.run --target ${TARGET} &> /tmp/.otb_build.log \
    && rm /opt/OTB-7.0.0-Linux64.run

RUN source ${TARGET}/otbenv.profile && cd ${TARGET} && ctest -S share/otb/swig/build_wrapping.cmake -VV

FROM ${BASE}

ENV TARGET=/opt/otb
COPY --from=build ${TARGET} ${TARGET}

ENV CMAKE_PREFIX_PATH=${TARGET} \
    PYTHONPATH=${TARGET}/lib/python \
    GDAL_DATA=${TARGET}/share/gdal \
    PROJ_LIB=/usr/local/share/proj \
    LC_NUMERIC=C \
    OTB_APPLICATION_PATH=${TARGET}/lib/otb/applications \
    PATH=${TARGET}/bin:$PATH

COPY . .
