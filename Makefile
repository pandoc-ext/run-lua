# Name of the filter file, *with* `.lua` file extension.
FILTER_FILE := $(wildcard *.lua)
# Name of the filter, *without* `.lua` file extension
FILTER_NAME = $(patsubst %.lua,%,$(FILTER_FILE))

# Allow to use a different pandoc binary, e.g. when testing.
PANDOC ?= pandoc
# Allow to adjust the diff command if necessary
DIFF = diff

# Test that running the filter on the sample input document yields
# the expected output.
test-%: $(FILTER_FILE) test/input-%.md test/test-%.yaml
	@$(PANDOC) --defaults test/test-$*.yaml | \
	    $(DIFF) test/expected-$*.md -

# Ensure that the `test` target is run each time it's called.
.PHONY: test
test: test-inline test-block

# Re-generate the expected output. This file **must not** be a
# dependency of the `test` target, as that would cause it to be
# regenerated on each run, making the test pointless.
test/expected-%: $(FILTER_FILE) test/input-%.md test/test-%.yaml
	@$(PANDOC) --defaults test/test-$*.yaml --output=test/$@

