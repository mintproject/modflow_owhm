FROM mintproject/base-ubuntu18

WORKDIR /app

RUN apt-get update \
    && apt-get install -y \
        wget \
        zip \
        build-essential \
        gfortran

RUN wget https://water.usgs.gov/ogw/modflow/MODFLOW-2005_v1.12.00/MF2005.1_12u.zip \
    && unzip MF2005.1_12u.zip \
    && mv MF2005.1_12u mf2005 \
    && cd mf2005/make \
    && make \
    && mv mf2005 /usr/bin/
