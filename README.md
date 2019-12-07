# Automated UML graph generation pipeline

Currently this tool uses Graphviz to generate diagrams.  

## Getting Started

### Setup

To ensure the tool is working run 

```
make test
```

from the project's root directory.

### Using the Tool
To run the tool generate some java with doclet annotations as specified in [the documentation for UMLGraph](https://www.spinellis.gr/umlgraph/doc/index.html) and then run 

```
./run.sh path/to/your/java.java
```

## Output
All diagrams are output in the output directory