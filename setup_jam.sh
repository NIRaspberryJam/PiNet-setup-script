#!/usr/bin/env bash
# Setup script for PiNet to add all required software for NI Raspberry Jam

sudo apt-get install gimp pv python3-matplotlib python3-gpiozero
sudo pip3 install network twython numpy

mkdir /opt/pinet_nijis_uploader
wget https://raw.githubusercontent.com/NIRaspberryJam/PiNet-setup-script/master/pinet_nijis_uploader/pinet_nijis_uploader.py /opt/pinet_nijis_uploader/pinet_nijis_uploader.py
wget https://raw.githubusercontent.com/NIRaspberryJam/PiNet-setup-script/master/pinet_nijis_uploader/pinet_nijis_uploader.sh /opt/pinet_nijis_uploader/pinet_nijis_uploader.sh
chmod +x /opt/pinet_nijis_uploader/pinet_nijis_uploader.sh
rm /etc/cron.d/pinet_nijis_uploader
wget https://raw.githubusercontent.com/NIRaspberryJam/PiNet-setup-script/master/pinet_nijis_uploader/pinet_nijis_uploader_cron /etc/cron.d/pinet_nijis_uploader_cron
if ! [[ -f "/opt/pinet_nijis_uploader/secret.py" ]]; then 
    cat "api_key = \"\"" > "/opt/pinet_nijis_uploader/secret.py"
    nano /opt/pinet_nijis_uploader/secret.py

fi