# ------------------------------------------------------------------------------------------------------------------------
# Description 	:	docker-minecraft (friend private world)
#							build an run docker image with servodroid map 
# Author			:	Thibault MONTAUFRAY
# Creation date	:	27/07/2016 (draft)
# -----------------------------------------------------------------------------

RUN echo 'Installation of minecraft server'

# Base system is the LTS version of Ubuntu.
FROM   ubuntu:14.04

# Environment data
ENV		DEBIAN_FRONTEND noninteractive
ENV		EULA=true	
ENV		VERSION=1.8.4
ENV		DIFFICULTY=easy
ENV		WHITELIST=JoolPanda;Wilkoala;Kydain;NKahn_;Taxicolor;Architecte_B;orthequine;Djahay;MEL12387;Mindus;SebastienDupont;AmosTrack
ENV		ICON=https://github.com/ThibaultMontaufray/Tools4Libraries/blob/master/ManagersDevComponents/servodroidIconColor.png
ENV		MAX_PLAYER=15
ENV		ANNOUNCE_PLAYER_ACHIEVEMENTS=true
ENV		ENABLE_COMMAND_BLOCK=false
ENV		GENERATE_STRUCTURES=true
ENV		VIEW_DISTANCE=10
ENV		MODE=survival
ENV		WORLD=https://github.com/ThibaultMontaufray/Docker-Minecraft/servodroid_friends_dreamworld.zip

# Download and install everything from the repos.
RUN    apt-get --yes update; apt-get --yes upgrade; apt-get --yes install software-properties-common
RUN    sudo apt-add-repository --yes ppa:webupd8team/java; apt-get --yes update
RUN    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections  && \
       echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections  && \
       apt-get --yes install curl oracle-java8-installer ; apt-get clean

# Load in all of our config files.
ADD    ./scripts/start /start

# Fix all permissions
RUN    chmod +x /start

# 25565 is for minecraft
EXPOSE 25565

# /data contains static files and database
VOLUME ["/data"]

# /start runs it.
CMD    ["/start"]

RUN echo 'Installation completed.'
