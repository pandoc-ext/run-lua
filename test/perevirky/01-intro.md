# run-lua

Executes any Lua command in a `lua` XML processing instruction and
includes the result in the document.

Example:

``` markdown {#input}
The number <?lua return 1 + 2 + 3 + 4 + 5?> is the fifth triangular number.
```

This yields

> <div id="output">
>
> The number 15 is the fifth triangular number.
>
> </div>
