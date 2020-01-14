FROM mintproject/base-ubuntu18

WORKDIR /app

RUN apt-get update \
    && apt-get install -y \
        wget \
        zip \
        build-essential \
        gfortran

RUN wget https://ca.water.usgs.gov/modeling-software/one-water-hydrologic-model/MF_OWHM_v1_0_min.zip \
        && unzip MF_OWHM_v1_0_min.zip \
        && rm MF_OWHM_v1_0_min.zip


RUN cd MF_OWHM_v1_0 \
        && sed -i "s/F90=ifort/F90=gfortran/g" makefile  \
        && sed -i "s/CC=icc/CC=gcc/g" makefile \
        && make

RUN cd MF_OWHM_v1_0 \
        && mv bin/OWHM.nix /usr/bin/
