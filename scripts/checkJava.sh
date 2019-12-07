#!/bin/bash

source `dirname $0`/constants.sh



echo "Checking for installed Java environment"

if [[ ! -d ${JAVA_PATH} ]]
then
    echo -e "${RED}ERROR${NC}:  Java home directory does not exist!  Please edit `pwd`/constants.sh and update JAVA_PATH to the location of your java installation directory"
    exit 1
fi

${JAVA_PATH}/bin/java -version && echo -e "${GREEN}Verified java installed successfully${NC}"