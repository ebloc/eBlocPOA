#!/bin/bash

curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo npm cache clean -f
sudo npm install npm -g
sudo npm install pm2 -g
sudo pm2 update
