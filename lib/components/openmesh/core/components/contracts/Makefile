TARGETS = validator-pass

.PHONY: build clean setup

$(TARGETS):
	@$(MAKE) -s -C $@

$(foreach TARGET,$(TARGETS),$(TARGET)-build):
	@$(MAKE) -s -C $(subst -build,'',$@) build

$(foreach TARGET,$(TARGETS),$(TARGET)-clean):
	@$(MAKE) -s -C $(subst -clean,'',$@) clean

$(foreach TARGET,$(TARGETS),$(TARGET)-setup):
	@$(MAKE) -s -C $(subst -setup,'',$@) setup

build: $(foreach TARGET,$(TARGETS),$(TARGET)-build)

clean: $(foreach TARGET,$(TARGETS),$(TARGET)-clean)

setup: $(foreach TARGET,$(TARGETS),$(TARGET)-setup)
