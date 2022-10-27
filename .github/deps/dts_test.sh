#!/bin/sh
cp -rf dpdk-next-net-private/ dpdk
tar -czvf dpdk.tar.gz dpdk
cp dpdk.tar.gz dpdk-dts-private/dep

apt-get install openssh-server
service ssh start
systemctl disable firewalld.service
apt-get install python3
python3 -m pip install -r dpdk-dts-private/requirements.txt

cd dpdk-dts-private
./dts