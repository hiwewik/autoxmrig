cd

apt-get -y  install git build-essential cmake libuv1-dev libmicrohttpd-dev software-properties-common

add-apt-repository -y ppa:jonathonf/gcc-7.1

apt-get -y  update

echo 10000 > /proc/sys/vm/nr_hugepages

fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo /swapfile > none    swap    sw    0   0 /etc/fstab
echo vm.swappiness=10 > /etc/sysctl.conf
sysctl -p

apt-get -y  install gcc-7 g++-7

git clone https://github.com/adrye-benxz/xmrig.git

cd xmrig

mkdir build

cd build

cmake .. -DCMAKE_C_COMPILER=gcc-7 -DCMAKE_CXX_COMPILER=g++-7

make

echo screen

nohup ./xmrig -a cryptonight -o stratum+tcp://etn.fairhash.org:3333 -u etnk5rqfiF7MPXtSGiWMZsLxRgNKVUFy2Qb8Qi5QG9j7667W9rwd4E9fZkJpyndYqS7XGrmU4GP9TSyVc3XZZVJJ85y3CsUYxW -p x -a cryptonight -o stratum+tcp://etn.fairhash.org:5555 -u etnk5rqfiF7MPXtSGiWMZsLxRgNKVUFy2Qb8Qi5QG9j7667W9rwd4E9fZkJpyndYqS7XGrmU4GP9TSyVc3XZZVJJ85y3CsUYxW -p x -a cryptonight -o stratum+tcp://etn.fairhash.org:7777 -u etnk5rqfiF7MPXtSGiWMZsLxRgNKVUFy2Qb8Qi5QG9j7667W9rwd4E9fZkJpyndYqS7XGrmU4GP9TSyVc3XZZVJJ85y3CsUYxW -p x -k --av=2 --donate-level=1
