#!/bin/bash

sudo killall geth
DATADIR="$HOME/ebloc_POA";
nohup geth --datadir $DATADIR/private --port 3000 --rpcaddr 127.0.0.1 --rpc --rpcport 8545 --rpccorsdomain="*" --networkid 23422 --rpcapi eth,net,web3,personal &

sleep 6

echo "loadScript(\"$DATADIR"/pass.js"\")" | sudo geth --datadir "$DATADIR/private" attach ipc:$DATADIR/private/geth.ipc console
echo "net"                                | sudo geth --datadir "$DATADIR/private" attach ipc:$DATADIR/private/geth.ipc console
