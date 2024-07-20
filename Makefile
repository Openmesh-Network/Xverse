TARGETS = bin docs lib src

.PHONY = any-target usage setup $(TARGETS)

any-target: $(TARGETS)

$(TARGETS):
	$(MAKE) -C $@

bin: src
src: lib

setup:
	@echo "Setup complete."

usage:	docs
	@cat docs/USAGE.txt

default: any-target
