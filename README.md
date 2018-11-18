# portal-ubuntu-core-image

Minimally configured amd64 (standard pc) Ubuntu Core image which uses cloud.config. This image:
  * Supresses console-conf, preventing someone with physical access to the device from creating a new user on first boot
  * Adds a user to the system on first boot
  * Configues the machines ethernet devices to be enabled and use DHCP (this network configuration is cloud-init's default).

I've added this to a public repo because the solution is simple, but a lack of documentation made this very hard to figure out. 

To use cloud-init, the official ubuntu-core / snap documentation suggests that you should add a cloud.conf file to your own gadget snap. If you use snapcraft to build this custom gadget, then you must also update snapcraft.yaml and use the "dump" plugin to copy cloud.conf into the final snap. This file will in turn be copied to your image, but cloud-init does not get enabled.

### Write your final image to a disk with the following command (on a mac it should be a lowercase M "bs=32m")
```
sudo dd if=/path/to/image.img of=/dev/diskN bs=32M
```



### These resources were helpful in figuring this out - thank you to the authors

Examples of official production-ready gagdet snaps
https://github.com/snapcore/pc-amd64-gadget
https://github.com/snapcore/pi3-gadget

Gadget snap format
https://docs.ubuntu.com/core/en/reference/gadget.html#examples-of-production-ready-gagdet-snaps

Make a kiosk tutorial
https://tutorials.ubuntu.com/tutorial/secure-ubuntu-kiosk?utm_source=MOTD&utm_medium=MOTD&utm_campaign=0)FY19_IOT#0

Create your own ubuntu core image tutorial
https://tutorials.ubuntu.com/tutorial/create-your-own-core-image#5
Create core image documentation
https://docs.ubuntu.com/core/en/guides/build-device/image-building

Deploy to KVM (great for testing)
https://www.ubuntu.com/download/iot/kvm

making an image using private snaps
https://snapcraft.io/blog/ubuntu-core-making-a-factory-image-with-private-snaps

interface list
https://docs.ubuntu.com/core/en/reference/interfaces/

wifi access point example (official snap)
https://docs.ubuntu.com/core/en/stacks/network/wifi-ap/docs/installation

first example I found of creating a system user with an assertation
https://docs.ubuntu.com/core/en/guides/build-device/image-building
system user assertation documentation
https://docs.ubuntu.com/core/en/reference/assertions/system-user

official documentation (reference of most things we need down the left side menu)
https://docs.ubuntu.com/core/en/

official snapcraft documentation - lots of helpful stuff listed down the left side menu
snapcraft - explanation and example of the gadget snap
https://forum.snapcraft.io/t/the-gadget-snap/696
snapcraft - explanation and example of the snap format
https://forum.snapcraft.io/t/the-snap-format/698

model assertation documentation
https://docs.ubuntu.com/core/en/reference/assertions/model
model assertation documentation
https://docs.ubuntu.com/core/en/reference/assertions/model

source for the chromium-mir-kiosk snap
https://git.launchpad.net/~gerboland/+git/chromium-snap/?h=mir-kiosk

some info on the configure hook
https://kyrofa.com/posts/snap-configuration-the-configure-hook

Cloud-init documentation
https://cloudinit.readthedocs.io/en/latest/topics/network-config.html
Example 
https://www.digitalocean.com/community/tutorials/how-to-use-cloud-config-for-your-initial-server-setup

Someone directly manipulating the image
https://forum.snapcraft.io/t/how-to-preconfigure-custom-image/4154
and the scripts they use
https://github.com/knitzsche/core-build-scripts

Adding a splash screen to a gadget
https://github.com/ogra1/pi3-gadget/commit/8fa1658f49a092ff6c8dc8874d06f9b9e362db34

Disabling console-conf
https://forum.snapcraft.io/t/disabling-console-conf-from-gadget-or-core-config-option/4358
https://raw.githubusercontent.com/knitzsche/core-build-scripts/master/disable-console-conf.sh
