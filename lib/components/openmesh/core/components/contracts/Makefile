TARGETS = validator-pass

.PHONY: build clean setup

$(TARGETS):
	@$(MAKE) $(MFLAGS) -C $@

$(foreach TARGET,$(TARGETS),$(TARGET)-build):
	@$(MAKE) $(MFLAGS) -C $(subst -build,,$@) build

$(foreach TARGET,$(TARGETS),$(TARGET)-clean):
	@$(MAKE) $(MFLAGS) -C $(subst -clean,,$@) clean

$(foreach TARGET,$(TARGETS),$(TARGET)-setup):
	@$(MAKE) $(MFLAGS) -C $(subst -setup,,$@) setup

build: $(foreach TARGET,$(TARGETS),$(TARGET)-build)

clean: $(foreach TARGET,$(TARGETS),$(TARGET)-clean)

setup: $(foreach TARGET,$(TARGETS),$(TARGET)-setup)
