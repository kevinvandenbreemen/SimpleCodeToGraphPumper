#!/bin/bash

echo "This tool assumes java is on the current user's path!  If it is not then the following check will fail."
java -version && echo -e "${GREEN}Verified java installed successfully${NC}"