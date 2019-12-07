#!/bin/bash

# Please set your JAVA_HOME before running
JAVA_PATH=

echo "Checking for installed Java environment"

if [[ ! -d ${JAVA_PATH} ]]
then
    echo "Java home directory does not exist!  Please edit `pwd`, file ${0} and update JAVA_PATH to the location of your java installation directory"
    exit 1
fi

${JAVA_PATH}/bin/java -version && echo "Verified java installed successfully"