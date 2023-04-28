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

The value that's returned by the Lua code is spliced back into the
document. The `=` character can be used as a shorthand for
`return` when placed at the beginning of an expression.

``` xml
<?lua =1 + 2 ?>
```

The filter tries to detect when the `return` has been omitted and
inserts it automatically in that case. Therefore, the above can be
shortened to

``` xml
<?lua 1 + 2 ?>
```

Raw attributes syntax with format `run-lua` or `runlua` can be
used as an alternative to the processing-instructions-based
syntax.

For example,

`````markdown
𝜋 ≈ `math.pi`{=runlua}
`````

yields

> 𝜋 ≈ 3.1415926535898

**Note*** that pandoc isn't an XML processor, and the processing
instruction is terminated by a single `>`. Use the “raw attribute”
syntax if your code contains that character:

    ```{=runlua}
    return 1 > 0 and 'all is well'
    ```

[CI badge]: https://img.shields.io/github/actions/workflow/status/pandoc-ext/run-lua/ci.yaml?branch=main&logo=github
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
