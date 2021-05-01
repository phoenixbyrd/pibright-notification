#!/bin/bash
sudo cp pibright.sh /usr/local/bin

sudo chown $USER:$USER /usr/local/bin/pibright.sh
sudo chmod +x /usr/local/bin/pibright.sh

sudo rm /usr/share/applications/pibright.desktop
sudo cp pibright.desktop /usr/share/applications/

sudo chown $USER:$USER /usr/share/applications/pibright.desktop

notify-send -i /usr/share/icons/TwisterOS/scalable/status/display-brightness-symbolic.svg --urgency=low --app-name="" PiBright Installed
