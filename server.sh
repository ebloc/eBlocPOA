e#!/bin/bash
nohup geth --datadir /home/alper/POA/private --rpcaddr 127.0.0.1 --rpc --rpcport 8546 --rpccorsdomain="*" --networkid 23422 --port 3016 --rpcapi eth,net,web3,personal &

echo 'loadScript("/home/alper/POA/pass.js")' | sudo geth --datadir "~/POA/private" attach ipc:/home/alper/POA/private/geth.ipc console
echo 'miner.start()'                         | sudo geth --datadir "~/POA/private" attach ipc:/home/alper/POA/private/geth.ipc console
