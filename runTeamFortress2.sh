#!/bin/bash
# Command-line parameters
#     -allowdebug
#         (Same as -debug ?)
#     -autoupdate
#         The server is searching for updates on startup (Linux/Unix only).
#     -console
#         SrcDS will run in console mode (Windows only).
#     -debug
#         Debug Mode.
#     -dev
#         Show developer messages.
#     -game <game or path>
#         Specifies which game/mod to run. Accepts either a path to a gameinfo.txt, or one of these pre-set values.
#     -insecure
#         Will start the server without Valve Anti-Cheat.
#     -ip
#         Specifies the address to use for the bind(2) syscall, which controls on which IP addresses the program is reachable on. It must either be a local address (an addresses of the host it runs on) or 0.0.0.0 (the wildcard). This has nothing to do with externally-visible addresses in NAT setups.
#     -maxplayers <number>
#         Specifies how many player slots the server can contain.
#     -nobots
#         Disable bots.
#     -nohltv
#         Disables SourceTV and closes its port (usually 27020).
#     -norestart
#         Won't attempt to restart failed servers.
#     -port
#         The port the server advertises to clients.
#     -steam
#         Use this (along with -console) when you are running the version of SRCDS downloaded through Steam.
#     -tickrate <number>
#         Specifies Server-Tickrate (for more info see Source Multiplayer Networking). This doesn't exist on TF2, CSS, L4D, and L4D2.
#     -timeout <number>
#         Sleep for <number> seconds before restarting a failed server.
#     -dumplongticks
#         Generate minidumps when there are long server frames
#     -usercon
#         Enables RCON for CS:GO Servers

#docker run -it --rm --net=host --name tf2 steamcmd/team-fortress-2 bash

#docker run -dP --name tf2 steamcmd/team-fortress-2 ./srcds_run -game tf +randommap -nohltv -norestart
#docker run -dP --name tf2 steamcmd/team-fortress-2 ./srcds_run -game tf +randommap -nohltv -autoupdate -steam_dir /home/steam/steamcmd -steamcmd_script gameinfo
docker run -d -p 27015:27015 --name tf2 steamcmd/team-fortress-2 ./srcds_run -game tf +randommap -nohltv -autoupdate -steam_dir /home/steam/steamcmd -steamcmd_script gameinfo
