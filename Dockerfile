FROM ubuntu:14.04
MAINTAINER Luis Elizondo "lelizondo@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get update --fix-missing

RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:mc3man/testing6
RUN apt-get update --fix-missing
RUN apt-get install -y ffmpeg libboost-all-dev libtag1-dev zlib1g-dev
RUN apt-get install -y make g++ git

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get autoremove -y

RUN cd /root ; git clone -b release-4.12 git://github.com/echonest/echoprint-codegen.git
RUN cd /root/echoprint-codegen/src ; make
RUN mv /root/echoprint-codegen/echoprint-codegen /usr/local/bin/echoprint-codegen
RUN rm -Rf /root/echoprint-codegen

WORKDIR /audio

VOLUME ["/audio"]

ENTRYPOINT ["/usr/local/bin/echoprint-codegen"]
