#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/config.sh
echo DATADIR: $DATADIR

sudo killall geth
sudo geth --datadir $DATADIR init custom.json
