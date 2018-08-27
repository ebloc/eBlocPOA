#!/bin/bash

# Updates peers
git fetch && git checkout origin/master -- peers.js 2>/dev/null

# Ensure running as root
if [ "$(id -u)" != "0" ]; then
  echo "sudo: Please run: sudo bash server.sh";
  exit
fi

PORT=3000;
DATADIR="$HOME/eblocPOA";

pid=$(sudo lsof -n -i :$PORT | grep LISTEN| awk '{print $2}');
if [ -n "$pid" ]; then
  sudo kill -9 $pid # sudo killall geth
fi

nohup geth --syncmode fast --cache=1024 --shh --datadir $DATADIR/private --port $PORT --rpcaddr 127.0.0.1 --rpc --rpcport 8545 --rpccorsdomain="*" --networkid 23422 --rpcapi admin,eth,net,web3,debug,personal,shh --gasprice "18000000000" > gethServer.out &

SLEEP_DURATION=10;
echo "Please wait $SLEEP_DURATION seconds for geth-server to be activated. You can decrease the sleep time on server.sh."
sleep $SLEEP_DURATION

echo "loadScript(\"$DATADIR"/peers.js"\")" | sudo geth --datadir "$DATADIR/private" attach ipc:$DATADIR/private/geth.ipc console
echo "loadScript(\"$DATADIR"/pass.js"\")"  | sudo geth --datadir "$DATADIR/private" attach ipc:$DATADIR/private/geth.ipc console
echo "net"                                 | sudo geth --datadir "$DATADIR/private" attach ipc:$DATADIR/private/geth.ipc console

bash stats.sh 
