# Setup instructions

Do your development on an Ubuntu machine (I'm using my mac and running Ubuntu on a virtual machine). Use the desktop version so you can also run kvm (a virtual machine). This makes it easy to test the resulting ubuntu core image.

### install snapcraft for building snaps
```
sudo apt install ubuntu-image snapd snapcraft
```

### install kvm, for testing our created images
```
sudo apt install qemu-kvm
```

### Building snaps

If you want to build snaps by runing ``snapcraft cleanbuild`` from a directory containing snapcraft.yaml, then install LXD (build environment for ensuring the correct version of all dependencies)

```
sudo snap install lxd
sudo lxd init (select all default values)

# If you want to use snapcraft as a non-root user, which is advised, then you need to add your user account to the lxd group:
sudo usermod -g lxd ${USER}

# Now you will need to either restart your session, reboot your computer, or use newgrp to acquire the new group assignment:
newgrp lxd
```

### create your snapcraft keys
```
# for faster key generation
sudo apt install rng-tools

# create key
snap create-key craig-snapcraft-production

# register the keys
snapcraft register-key
```
