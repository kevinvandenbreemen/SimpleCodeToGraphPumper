.PHONY: setup

setup:
	@echo "Setup for the Simple Code to Graph Pumper (SCGP)"
	./scripts/checkJava.sh
	@echo "Checking for graphviz"
	./scripts/checkGraphviz.sh