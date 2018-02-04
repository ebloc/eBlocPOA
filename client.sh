#!/bin/bash
DATADIR="$HOME";
geth --datadir "~/ebloc_POA/private" attach ipc:$DATADIR/ebloc_POA/private/geth.ipc console
