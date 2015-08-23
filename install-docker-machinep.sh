#!/bin/bash
# docker-machine helper
# Installs docker-machine compatible with parallels as `docker-machinep`,
# leaving the default binary names alone.
#

PARALLELS_VER=0.4.0
INSTALL_LOC=/usr/local/bin/

# Get machinep
curl -L https://github.com/Parallels/docker-machine/releases/download/parallels%2F$PARALLELS_VER/docker-machine_darwin-amd64 > /usr/local/bin/docker-machine-parallels

# Install wrapper
cp ./docker-machinep $INSTALL_LOC/docker-machinep

# execute perms
chmod +x $INSTALL_LOC/docker-machine-parallels
chmod +x $INSTALL_LOC/docker-machinep
