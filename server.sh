#!/bin/bash
DATADIR="/Users/alper";
nohup geth --datadir $DATADIR/POA/private --rpcaddr 127.0.0.1 --rpc --rpcport 8545 --rpccorsdomain="*" --networkid 23422 --rpcapi eth,net,web3,personal &

echo "loadScript(\"$DATADIR"/POA/pass.js"\")"    | sudo geth --datadir "~/POA/private" attach ipc:$DATADIR/POA/private/geth.ipc console
