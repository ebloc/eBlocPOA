#!/bin/bash
DATADIR="$HOME/eBlocPOA";
sudo geth --datadir "$DATADIR/private" attach ipc:$DATADIR/private/geth.ipc console
