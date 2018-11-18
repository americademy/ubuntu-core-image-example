# portal-ubuntu-core-image

Minimally configured amd64 (standard pc) Ubuntu Core image which uses cloud.config. This image:
  * Supresses console-conf, preventing someone with physical access to the device from creating a new user on first boot
  * Adds a user to the system on first boot
  * Configues the machines ethernet devices to be enabled and use DHCP (this network configuration is cloud-init's default).

I've added this to a public repo because the solution is simple, but a lack of documentation made this very hard to figure out. 

To use cloud-init, the official ubuntu-core / snap documentation suggests that you should add a cloud.conf file to your own gadget snap. If you use snapcraft to build this custom gadget, then you must also update snapcraft.yaml and use the "dump" plugin to copy cloud.conf into the final snap. This file will in turn be copied to your image, but cloud-init does not get enabled.
