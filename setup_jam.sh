#!/usr/bin/env bash
# Setup script for PiNet to add all required software for NI Raspberry Jam

sudo ltsp-chroot --arch armhf apt install gimp pv python3-matplotlib python3-gpiozero
sudo ltsp-chroot --arch armhf pip3 install network twython numpy

mkdir /opt/pinet_nijis_uploader
wget https://raw.githubusercontent.com/NIRaspberryJam/PiNet-setup-script/master/pinet_nijis_uploader/pinet_nijis_uploader.py -O /opt/pinet_nijis_uploader/pinet_nijis_uploader.py
wget https://raw.githubusercontent.com/NIRaspberryJam/PiNet-setup-script/master/pinet_nijis_uploader/pinet_nijis_uploader.sh -O /opt/pinet_nijis_uploader/pinet_nijis_uploader.sh
chmod +x /opt/pinet_nijis_uploader/pinet_nijis_uploader.sh
rm /etc/cron.d/pinet_nijis_uploader
wget https://raw.githubusercontent.com/NIRaspberryJam/PiNet-setup-script/master/pinet_nijis_uploader/pinet_nijis_uploader_cron -O /etc/cron.d/pinet_nijis_uploader_cron
if ! [[ -f "/opt/pinet_nijis_uploader/secret.py" ]]; then 
    echo "api_key = \"\"" > "/opt/pinet_nijis_uploader/secret.py"
    nano /opt/pinet_nijis_uploader/secret.py

fi
service cron reload