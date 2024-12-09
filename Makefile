# Makefile for running the cleanup and linux scripts

# Targets and their dependencies
.PHONY: linux clean

# Clean target
clean:
	@echo "Running cleanup script..."
	./bin/cleanup.sh

# Linux target, depends on clean target
linux: clean
	@echo "Running linux script..."
	./bin/linux.sh
