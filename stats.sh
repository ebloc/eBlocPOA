#!/bin/bash
#To see your node on http://ebloc.cmpe.boun.edu.tr:3015
DATADIR="$HOME"
sudo pm2 delete app
sudo INSTANCE_NAME=myNameIs RPC_HOST=localhost WS_SERVER=http://79.123.177.145:3015 WS_SECRET=63r98c3uz0cyg68v RPC_PORT=8545 LISTENING_PORT=30303 pm2 start $DATADIR/eth-net-intelligence-api/app.js
