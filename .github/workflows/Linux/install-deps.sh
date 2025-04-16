#!/usr/bin/bash

set -x

sudo touch /etc/apt/sources.list.d/libtinfo5.sources
sudo chmod a+xrw /etc/apt/sources.list.d/libtinfo5.sources
echo "
Types: deb
URIs: http://old-releases.ubuntu.com/ubuntu/
Suites: lunar
Components: universe
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
" >> /etc/apt/sources.list.d/libtinfo5.sources

sudo touch /etc/apt/sources.list.d/libncurses5.sources
sudo chmod a+xrw /etc/apt/sources.list.d/libncurses5.sources
echo "
Types: deb
URIs: http://security.ubuntu.com/ubuntu
Suites: focal-security
Components: main universe
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
" >> /etc/apt/sources.list.d/libncurses5.sources

sudo apt-get update
sudo apt-get install openssl gcc-multilib python3-venv doxygen graphviz libtinfo5 libncurses5

doxygen --version