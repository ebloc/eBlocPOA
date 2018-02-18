#!/bin/bash

eblocPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" # root path of the repo
geth --datadir="$eblocPath/private" init "$eblocPath/custom.json"
