#!/bin/bash

PORT=3000;
DATADIR="$HOME/ebloc_POA";

sudo killall geth
# pid=$(sudo lsof -n -i :$PORT | grep LISTEN| awk '{print $2}');
# sudo kill -9 $pid;

nohup geth --datadir $DATADIR/private --port $PORT --rpcaddr 127.0.0.1 --rpc --rpcport 8545 --rpccorsdomain="*" --networkid 23422 --rpcapi eth,net,web3,personal > gethServer.out &

echo "Please wait few seconds for geth-server to be activated."
sleep 6

echo "loadScript(\"$DATADIR"/peers.js"\")" | sudo geth --datadir "$DATADIR/private" attach ipc:$DATADIR/private/geth.ipc console
echo "net"                                 | sudo geth --datadir "$DATADIR/private" attach ipc:$DATADIR/private/geth.ipc console
bash stats.sh 
