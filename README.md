run-lua
==================================================================

[![GitHub build status][CI badge]][CI workflow]

Executes any Lua command in a `lua` XML processing instruction and
includes the result in the document.

Example:

``` markdown
The fifth triangular number is <?lua return 1 + 2 + 3 + 4 + 5?>.
```

This yields

> The fifth triangular number is 15.


[CI badge]: https://img.shields.io/github/workflow/status/pandoc-ext/run-lua/CI?logo=github
[CI workflow]: https://github.com/pandoc-ext/run-lua/actions/workflows/ci.yaml


Usage
------------------------------------------------------------------

The filter modifies the internal document representation; it can
be used with many publishing systems that are based on pandoc.

### Plain pandoc

Pass the filter to pandoc via the `--lua-filter` (or `-L`) command
line option.

    pandoc --lua-filter run-lua.lua ...

### Quarto

Users of Quarto can install this filter as an extension with

    quarto install extension pandoc-ext/run-lua

and use it by adding `run-lua` to the `filters` entry
in their YAML header.

``` yaml
---
filters:
  - run-lua
---
```

### R Markdown

Use `pandoc_args` to invoke the filter. See the [R Markdown
Cookbook](https://bookdown.org/yihui/rmarkdown-cookbook/lua-filters.html)
for details.

``` yaml
---
output:
  word_document:
    pandoc_args: ['--lua-filter=run-lua.lua']
---
```

License
------------------------------------------------------------------

This pandoc Lua filter is published under the MIT license, see
file `LICENSE` for details.
