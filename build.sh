#!/bin/bash

# stop execution if any commands in this script fail
set -e



# Create the signed model assertation. 
echo Creating Model Assertation

# For convenience, we replace %TIMESTAMP% with the current time
TIMESTAMP=`date -Iseconds --utc`

# Where craig-snapcraft-production is the name of the snapcraft key you've created 
cat model.json | sed s/%TIMESTAMP%/$TIMESTAMP/ | snap sign -k craig-snapcraft-production > model.model



# Build the image
echo Building Image

# pass cloud.conf to ubuntu image
# NOTE: if there are other snaps you are developing locally, then you can include them under required snaps in model.json and make ubuntu-image aware of them with ```--extra-snaps ./snap-name/snap-name_0.1_amd64.snap```
sudo ubuntu-image -O image --cloud-init cloud.conf model.model



# If you are running this on Ubuntu desktop, then it's very convenient to test the image right away in KVM
# You can SSH to the image via ssh craig@localhost -p 8022
if [ -f "/usr/bin/kvm" ]; then
  echo Running Image
  sudo kvm -smp 2 -m 1500 -netdev user,id=mynet0,hostfwd=tcp::8022-:22,hostfwd=tcp::8090-:80 -device virtio-net-pci,netdev=mynet0 -vga qxl -drive file=image/pc.img,format=raw
fi
