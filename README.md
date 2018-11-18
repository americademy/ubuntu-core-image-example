# portal-ubuntu-core-image

Minimally configured Ubuntu Core image which uses cloud.config. This image:
  * Supresses console-conf, preventing someone with physical access to the device from creating a new user on first boot
  * Adds a user to the system on first boot
  * Configues the devices ethernet devices to be enabled and use DHCP (this network configuration is cloud-init's default).
