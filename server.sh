#!/bin/bash

# ensure running as root
if [ "$(id -u)" != "0" ]; then
  echo "sudo: Please run: sudo bash server.sh";
  exit
fi

PORT=3000;
DATADIR="$HOME/eblocPOA";

sudo killall geth
# pid=$(sudo lsof -n -i :$PORT | grep LISTEN| awk '{print $2}');
# sudo kill -9 $pid;

nohup geth --datadir $DATADIR/private --port $PORT --rpcaddr 127.0.0.1 --rpc --rpcport 8545 --rpccorsdomain="*" --networkid 23422 --rpcapi eth,net,web3,personal --gasprice "18000000000" > gethServer.out &

echo "Please wait 10 seconds for geth-server to be activated. You can decrease the sleep time on server.sh."
sleep 10

echo "loadScript(\"$DATADIR"/peers.js"\")" | sudo geth --datadir "$DATADIR/private" attach ipc:$DATADIR/private/geth.ipc console
echo "loadScript(\"$DATADIR"/pass.js"\")"  | sudo geth --datadir "$DATADIR/private" attach ipc:$DATADIR/private/geth.ipc console
echo "net"                                 | sudo geth --datadir "$DATADIR/private" attach ipc:$DATADIR/private/geth.ipc console

bash stats.sh 
