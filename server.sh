#!/bin/bash

BLUE="\033[1;36m"
NC="\033[0m"  # no color
SLEEP_DURATION=10
SLEEP_TILL_SERVER_STARTS=1

connect_peers() {
    printf "${BLUE}==>${NC} Connecting to peers\n"
    echo "loadScript(\"$REPODIR"/peers.js"\")" | \
        sudo geth --datadir "$DATADIR" attach ipc:$FILE_IPC console
}

_kill() {
    pkill -1 -f $1
    pids=$(pgrep -f -l $1 | awk '{print $1}')
    if [ "$str" != "" ]
    then
        sudo kill -9 $pids
    fi
}

update_peers () {
    (&>/dev/null git fetch --all &)  # update peers
    git checkout origin/master -- peers.js 2>/dev/null
    git checkout origin/master -- custom.json 2>/dev/null
}


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/config.sh

FILE_IPC=$DATADIR/geth.ipc
printf "${BLUE}==>${NC} FILE_IPC_PATH=$FILE_IPC\n"
printf "${BLUE}==>${NC} REPODIR=$REPODIR\n"

if [ "$(id -u)" != "0" ]; then
    # ensures running as root
    echo "E: Please run: sudo ./server.sh";
    exit
fi

echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-" >> $REPODIR/geth_server.out
# update_peers

if [ -z "$REPODIR" ]
then
    echo "E: Fill `REPODIR` variable in config.sh. You can run ./initialize.sh"
    exit
fi

if [ -z "$PORT" ]
then
    echo "E: PORT variable is empty, please set"
    exit
else
    printf "${BLUE}==>${NC} PORT=$PORT\n"
fi

pid=$(sudo lsof -n -i :$PORT | grep LISTEN| awk '{print $2}');
if [ -n "$pid" ]; then
    sudo kill -9 $pid
fi

_kill geth
geth version >> $REPODIR/geth_server.out
sudo chown $(whoami) -R $DATADIR
nohup geth --syncmode fast --cache=1024 --datadir $DATADIR --port $PORT \
      --http --http.addr 127.0.0.1 --http.port $RPCPORT --http.corsdomain "*" \
      --networkid 23422 --http.api db,admin,eth,net,web3,debug,personal \
      --miner.gastarget 10000000 --miner.gasprice 18000000000 \
      --allow-insecure-unlock >> $REPODIR/geth_server.out 2>&1 &

sleep $SLEEP_DURATION
for i in {0..60}
do
    if [ -e "$FILE_IPC" ]; then
        connect_peers
        sleep $SLEEP_TILL_SERVER_STARTS
        connect_peers  # called again in case peers are not connected
        echo "loadScript(\"$DIR"/pass.js"\")" | \
            sudo geth --datadir "$DATADIR" attach ipc:$DATADIR/geth.ipc console

        FILE=$DIR/unlock.js
        if [ -f "$FILE" ]; then
            echo "loadScript(\"$DIR"/unlock.js"\")" | \
                sudo geth --datadir "$DATADIR" attach ipc:$DATADIR/geth.ipc console
        fi
        echo "net" | sudo geth --datadir "$DATADIR" attach ipc:$DATADIR/geth.ipc console | tail -n +10 | head -n -1
        break
    else
        echo -e "Try $i: Sleeping for $SLEEP_DURATION seconds"
        sleep $SLEEP_DURATION
    fi
done

echo ""
$DIR/stats.sh
sleep 0.25
sudo chown $(whoami) $DATADIR/geth.ipc

# tail -f geth_server.out
