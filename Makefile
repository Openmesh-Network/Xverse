TARGETS = bin docs lib src
MAKEFLAGS =? -s
.PHONY = $(TARGETS) setup usage clean

usage:
	@$(MAKE) $(MFLAGS) -C docs usage

all: clean setup build

$(TARGETS):
	@$(MAKE) $(MFLAGS) -C $@

bin: src
src: lib

$(foreach TARGET,$(TARGETS),$(TARGET)-build):
	@$(MAKE) $(MFLAGS) -C $(subst -build,,$@) build

$(foreach TARGET,$(TARGETS),$(TARGET)-clean):
	@$(MAKE) $(MFLAGS) -C $(subst -clean,,$@) clean

$(foreach TARGET,$(TARGETS),$(TARGET)-setup):
	@$(MAKE) $(MFLAGS) -C $(subst -setup,,$@) setup

build: $(foreach TARGET,$(TARGETS),$(TARGET)-build)
	$(info Build complete.)

clean: $(foreach TARGET,$(TARGETS),$(TARGET)-clean)
	$(info Clean complete.)

setup: $(foreach TARGET,$(TARGETS),$(TARGET)-setup)
	$(info Setup complete.)
