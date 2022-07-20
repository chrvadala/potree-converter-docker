
# Instructions: https://github.com/chrvadala/potree-converter-docker.git

FROM ubuntu:20.04
MAINTAINER cvdlab
VOLUME ["/input", "/output"]

# in case
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
libtiff-dev libgeotiff-dev libgdal-dev \
libboost-system-dev libboost-thread-dev libboost-filesystem-dev libboost-program-options-dev libboost-regex-dev libboost-iostreams-dev libtbb-dev \
git cmake build-essential wget

WORKDIR /opt

# install LAStools
RUN git clone https://github.com/m-schuetz/LAStools.git && cd LAStools/LASzip && mkdir build && cd build && \
cmake -DCMAKE_BUILD_TYPE=Release .. && make && make install && ldconfig

# install PotreeConverter
RUN git clone -b develop https://github.com/potree/PotreeConverter.git && cd PotreeConverter && mkdir build && cd build && \
cmake -DCMAKE_BUILD_TYPE=Release -DLASZIP_INCLUDE_DIRS=/opt/LAStools/LASzip/dll/ -DLASZIP_LIBRARY=/usr/local/lib/liblaszip.so .. && \
make && cp -r /opt/PotreeConverter/resources /opt/PotreeConverter/build/resources

WORKDIR /opt/PotreeConverter/build

CMD PotreeConverter
