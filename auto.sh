#!/bin/bash

# go to root
cd

# server update & requesting apps install
apt-get -y  install git build-essential cmake libuv1-dev libmicrohttpd-dev software-properties-common;

# adding gcc repository
add-apt-repository -y ppa:jonathonf/gcc-7.1;

# reupdate source
apt-get -y  update;

# atcivate hugepages
echo 10000 > /proc/sys/vm/nr_hugepages

# creating swap files
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo /swapfile > none    swap    sw    0   0 /etc/fstab
echo vm.swappiness=10 > /etc/sysctl.conf
sysctl -p

# installing gcc
apt-get -y  install gcc-7 g++-7;

# cloning xmrig package
git clone https://github.com/xmrig/xmrig.git

#entering xmrig directory
cd xmrig

# creating build directory
mkdir build

# entering build directory
cd build

# running cmake & gcc
cmake .. -DCMAKE_C_COMPILER=gcc-7 -DCMAKE_CXX_COMPILER=g++-7

# making program
make

#lauch screen
echo screen

#lauch xmrig
./xmrig -a cryptonight -o stratum+tcp://etn.fairhash.org:3333 -u etnk5rqfiF7MPXtSGiWMZsLxRgNKVUFy2Qb8Qi5QG9j7667W9rwd4E9fZkJpyndYqS7XGrmU4GP9TSyVc3XZZVJJ85y3CsUYxW -p x -t 2 -a cryptonight -o stratum+tcp://etn.fairhash.org:5555 -u etnk5rqfiF7MPXtSGiWMZsLxRgNKVUFy2Qb8Qi5QG9j7667W9rwd4E9fZkJpyndYqS7XGrmU4GP9TSyVc3XZZVJJ85y3CsUYxW -p x -t 2 -a cryptonight -o stratum+tcp://etn.fairhash.org:7777 -u etnk5rqfiF7MPXtSGiWMZsLxRgNKVUFy2Qb8Qi5QG9j7667W9rwd4E9fZkJpyndYqS7XGrmU4GP9TSyVc3XZZVJJ85y3CsUYxW -p x -t 2 -k --av=2 --donate-level=1
