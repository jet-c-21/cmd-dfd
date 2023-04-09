#!/bin/bash
set -e

git clone https://github.com/neurobin/shc.git
cd shc
./configure
make
sudo make install

shc -f cmd-dfd.sh -o cmd-dfd
