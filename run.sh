#!/bin/bash

if [[ -z $1 ]]
then
    echo "Please specify filename"
    exit 1
fi

filename=$1

# Make sure you've run make first before running this command
source `dirname $0`/scripts/constants.sh

echo "Executing diagram generation with '${filename}'..."
${JAVA_PATH}/bin/java -jar cp/${UMLGRAPH_JAR} -private -output output/temp.dot ${filename} && \
dot -Tpng -o output/graph.png output/temp.dot && \
echo -e "${GREEN} Job's done!${NC}"