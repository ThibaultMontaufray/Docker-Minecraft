# ------------------------------------------------------------------------------------------------------------------------
# Description        :      docker-minecraft (friend private world)
#                           build an run docker image with servodroid map 
# Author             :      Thibault MONTAUFRAY
# Creation date      :      27/07/2016 (draft)
# Version            :      0.0.2
# -----------------------------------------------------------------------------

RUN echo 'Installation of minecraft server'

# Base system is the LTS version of Ubuntu.
FROM   itzg/minecraft-server:latest

MAINTAINER thibault.montaufray

# Environment data
ENV     EULA=true	
ENV     VERSION=1.8.4
ENV     DIFFICULTY=easy
ENV     WHITELIST=JoolPanda;Wilkoala;Kydain;NKahn_;Taxicolor;Architecte_B;orthequine;Djahay;MEL12387;Mindus;SebastienDupont;AmosTrack
ENV     ICON=https://github.com/ThibaultMontaufray/Tools4Libraries/blob/master/ManagersDevComponents/servodroidIconColor.png
ENV     MAX_PLAYER=15
ENV     ANNOUNCE_PLAYER_ACHIEVEMENTS=true
ENV     ENABLE_COMMAND_BLOCK=false
ENV     GENERATE_STRUCTURES=true
ENV     VIEW_DISTANCE=10
ENV     MODE=survival
ENV     WORLD=https://github.com/ThibaultMontaufray/Docker-Minecraft/servodroid_friends_dreamworld.zip

RUN echo 'Installation completed.'
