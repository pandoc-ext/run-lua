The value that's returned by the Lua code is spliced back into the
document. The `=` character can be used as a shorthand for
`return` when placed at the beginning of an expression.

``` xml {#input format="markdown"}
1 + 2 = <?lua =1 + 2 ?>
```

Result:

> <div id="output">
>
> 1 + 2 = 3
>
> </div>
