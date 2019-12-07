#!/bin/bash

source `dirname $0`/constants.sh

if dot -V ; then
    echo -e "${GREEN} Graphviz found on your system${NC}"
else
    echo -e "${RED}ERROR${NC}:  Please install graphviz.  On an ubuntu machine type 'apt-get install graphviz'"
    exit 1
fi