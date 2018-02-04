#!/bin/bash

DATADIR="$HOME";
sudo killall geth
nohup geth --datadir $DATADIR/ebloc_POA/private --port 3000 --rpcaddr 127.0.0.1 --rpc --rpcport 8545 --rpccorsdomain="*" --networkid 23422 --rpcapi eth,net,web3,personal &

sleep 5

echo "loadScript(\"$DATADIR"/ebloc_POA/pass.js"\")"    | sudo geth --datadir "$DATADIR/ebloc_POA/private" attach ipc:$DATADIR/ebloc_POA/private/geth.ipc console
echo "net"                                             | sudo geth --datadir "$DATADIR/ebloc_POA/private" attach ipc:$DATADIR/ebloc_POA/private/geth.ipc console
