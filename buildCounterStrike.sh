#!/bin/bash

docker build -t steamcmd:counter-strike \
       --build-arg APP_ID=90 \
       --build-arg VALIDATE="" \
       --build-arg APP_OPTIONS='+app_set_config "90 mod cstrike"' \
       .
