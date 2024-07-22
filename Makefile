TARGETS = bin docs lib src

.PHONY = $(TARGETS) setup usage clean

usage:
	@$(MAKE) -s -C docs usage

$(TARGETS):
	@$(MAKE) -s -C $@

bin: src
src: lib

$(foreach TARGET,$(TARGETS),$(TARGET)-build):
	@$(MAKE) -s -C $(subst -build,'',$@) build

$(foreach TARGET,$(TARGETS),$(TARGET)-clean):
	@$(MAKE) -s -C $(subst -clean,'',$@) clean

$(foreach TARGET,$(TARGETS),$(TARGET)-setup):
	@$(MAKE) -s -C $(subst -setup,'',$@) setup

build: $(foreach TARGET,$(TARGETS),$(TARGET)-build)
	$(info Build complete.)

clean: $(foreach TARGET,$(TARGETS),$(TARGET)-clean)
	$(info Clean complete.)

setup: $(foreach TARGET,$(TARGETS),$(TARGET)-setup)
	$(info Setup complete.)
