FROM ubuntu:xenial
MAINTAINER Shaun Murakami <stmuraka@us.ibm.com>

EXPOSE 27015 27015/udp

RUN apt-get -y update \
 && apt-get -y install \
        lib32gcc1 \
        lib32tinfo5 \
        curl \
# Cleanup package files
 && apt-get autoremove  \
 && apt-get autoclean

RUN useradd -m steam
USER steam

RUN mkdir /home/steam/steamcmd
WORKDIR /home/steam/steamcmd

RUN curl -sqL 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar zxvf -

# Default APP_ID 90 = Counter Strike
# More APP_IDs here: https://developer.valvesoftware.com/wiki/Dedicated_Servers_List#Linux_Dedicated_Servers
ARG APP_ID
ENV APP_ID ${APP_ID:-90}

ARG VALIDATE
ENV VALIDATE ${VALIDATE:-validate}

ARG APP_OPTIONS
ENV APP_OPTIONS ${APP_OPTIONS:-}

#+app_set_config 90 mod cstrike

# Install Game
#RUN ./steamcmd.sh +login anonymous +force_install_dir ../game ${APP_OPTIONS} +app_update ${APP_ID} ${VALIDATE} +quit
COPY updateGame.sh ./
RUN ./updateGame.sh

# Link steam client lib
RUN mkdir -p ~/.steam/sdk32/ \
 && ln -s ~/steamcmd/linux32/steamclient.so ~/.steam/sdk32/steamclient.so

WORKDIR /home/steam/game

# start game: e.g. ./hlds_run -game cstrike +maxplayers 8
# start tf2: ./srcds_run -game tf
