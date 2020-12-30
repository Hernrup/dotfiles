#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o nounset

mkdir -p /mnt/home/opt/srv
mkdir -p /mnt/home/var/data
sudo mount -t nfs 192.168.0.4:/opt/srv /mnt/home/opt/srv
sudo mount -t nfs 192.168.0.4:/var/data /mnt/home/var/data

echo "Mount successfull"