FROM google/golang:latest

MAINTAINER Tiago Natel de Moura <tiago.natel@neoway.com.br>

ENV DEBIAN_FRONTEND noninteractive

ENV GDAL_VERSION 2.0.0

RUN apt-get -qq update \
 && apt-get -qqy upgrade \
 && apt-get -qqy install wget \
 	g++ make git pkg-config\
 	zlib1g-dev libkml-dev \
 && cd /usr/src \
 && wget http://download.osgeo.org/gdal/2.0.0/gdal-${GDAL_VERSION}.tar.gz \
 && tar xzf gdal-${GDAL_VERSION}.tar.gz \
 && cd gdal-${GDAL_VERSION} \
 && ./configure \
 	--prefix=/usr --sysconfdir=/etc \
 	--with-libkml \
 	--without-pcre --without-pcraster --without-grib --without-png --without-gif --without-jpeg \
 && make -j4 \
 && make install

