#!/bin/bash

source `dirname $0`/constants.sh
umlgraph_url=https://www.spinellis.gr/umlgraph/jars/UmlGraph-5.7_2.32-SNAPSHOT.jar
classpathDir=../cp

cd `dirname ${0}`

if [[ -e ${classpathDir} ]]
then
    echo "umlgraph tool already installed"
    exit 0
fi

mkdir ${classpathDir}
cd ${classpathDir}

wget ${umlgraph_url} && echo -e "${GREEN}Successfully downloaded umlgraph${NC}"