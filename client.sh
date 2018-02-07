#!/bin/bash
DATADIR="$HOME/ebloc_POA";
geth --datadir "$DATADIR/private" attach ipc:$DATADIR/private/geth.ipc console
