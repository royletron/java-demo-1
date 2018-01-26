#This script deletes all unit tests. Use for example if you have an alternative test suite and you want to measure coverage from scratch.

for d in .; do rm -rf $d/src/test/java/; done
