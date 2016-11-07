#!/bin/bash

# Create gameinfo
cat <<- EOD > ./gameinfo
login anonymous
force_install_dir /home/steam/game ${APP_OPTIONS}
app_update ${APP_ID} ${VALIDATE}
quit
EOD


for i in {1..5}; do
    #./steamcmd.sh +login anonymous +force_install_dir /home/steam/game ${APP_OPTIONS} +app_update ${APP_ID} ${VALIDATE} +quit
    ./steamcmd.sh +runscript gameinfo
    [ $? -eq 0 ] && break || [ $i -eq 5 ] && { echo "ERROR: Failed to update."; exit 1; } || echo -n "retrying...$i"
done
