#!/bin/bash

eblocPath="$PWD"
geth --datadir="$eblocPath/private" init custom.json

var=$(echo $eblocPath | sed 's/\//\\\//g')
sed -i.bak "s/^\(DATADIR=\).*/\1\"$var\"/" server.sh && rm server.sh.bak
sed -i.bak "s/^\(DATADIR=\).*/\1\"$var\"/" client.sh && rm client.sh.bak
