.PHONY: setup test swiftTest

setup:
	@echo "Setup for the Simple Code to Graph Pumper (SCGP)"
	./scripts/checkJava.sh
	@echo "Checking for graphviz"
	./scripts/checkGraphviz.sh
	-mkdir output

test: setup
	@echo "Test recipe to verify you have a working instance of the pumper!"
	./run.sh tests/simpleclass.java

swiftTest: setup
	swift test