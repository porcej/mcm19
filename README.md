# mcm19 - Reverse Proxy for MCM19 Hams running on a Raspberry Pi
### A quick and dirty tutorial on running a Nginx reverse proxy on a Raspberry Pi

1. Download the latest Raspbian Lite, version Buster as of time of writing from the Raspberry Pi foundation. Raspbian Download
1. Write the download image to an SD card. Please see the Raspberry Pi Foundation's Tutorial if you need help here Raspbian Installation
1. Log into the Raspberry Pi username: pi password: raspberry
1. Update installed software: $ sudo apt-get update && sudo apt-get upgrade -y
1. Run the Raspbian Config Utility: $ sudo raspi-config
  * Expand the filesystem: Advanced -> Expand Filesystem
  * Update CPU/GPU Memory Split: Advanced -> Memory Split -> 16
  * Enable SSH (Optional): Interfaces -> SSH -> Select Enabled
  * Configure Locilization Options:
    * Set Local: Localization Options -> Change Local -> Select as appropriate, Here in Northern Virgina, I use en_US-UTF-8
    * Set Timezone Localization Options -> Change Time Zone -> Select as appropraite
    * If using Wifi set the Wifi County: Localization Options -> Wifi Country -> Select as appropraite
  * Set Hostname: Network Options -> Hostname
  * If using Wifi, setup Wifi Network: Network Options -> Wifi
1. Reboot the Pi $ sudo reboot
1. When the Raspberry Pi boots up either log in through the termial of ssh in
1. Install Nginx: $ sudo apt-get install nginx -y
1. Start Nginx: $ sudo systemctl start nginx
1. Change to the Nginx sites-available directory: $ cd /etc/nginx/sites-available/
1. Download the starter configuration: $ sudo curl -o mcm-prd https://kt3i.com/files/mcm-prd
1. Edit the configuration to listen for your host. Use either a FQDN thats registered in DNS or the Raspberry Pi's IP address:
1. $sudo nano mcm-prd
1. Replace DEFALUT_HOSTNAME with either the Pi's IP address or a FQDN thats registered in DNS reachable by your intended clients
1. Symlink the configuration to the sites-enabled directory: $ sudo ln -s /etc/nginx/sites-available/mcm-prd /etc/nginx/sites-enabled/mcm-prd
1. Test the confiuration: sudo nginx -t
1. If the above test passes, reload Nginx: sudo systemctl reload nginx
