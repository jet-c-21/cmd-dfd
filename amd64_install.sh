#!/bin/bash
set -e

sudo apt install -y shc
shc -f cmd-dfd.sh -o cmd-dfd && sudo mv cmd-dfd /usr/local/bin/
cd ..
rm -rf cmd-dfd
