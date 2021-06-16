#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/config.sh
sudo geth --datadir "$DATADIR" attach ipc:$DATADIR/geth.ipc console
