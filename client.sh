#!/bin/bash
DATADIR="/Users/alper";
geth --datadir "~/POA/private" attach ipc:$DATADIR/POA/private/geth.ipc console
