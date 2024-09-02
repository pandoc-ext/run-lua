# Allow to use a different pandoc binary, e.g. when testing.
PANDOC ?= pandoc

test-%: $(FILTER_FILE) test/input-%.md test/test-%.yaml
	@$(PANDOC) --defaults test/test-$*.yaml | \
	    $(DIFF) test/expected-$*.md -

# Ensure that the `test` target is run each time it's called.
.PHONY: test

# Check expected results with perevir
test:
	pandoc lua test/runtests.lua test/perevirky/
