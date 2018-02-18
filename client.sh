#!/bin/bash
DATADIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"; # root path of the repo
sudo geth --datadir "$DATADIR/private" attach ipc:$DATADIR/private/geth.ipc console
