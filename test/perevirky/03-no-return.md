The filter tries to detect when the `return` has been omitted and
inserts it automatically in that case. Therefore, the above can be
shortened to

``` xml {#input format="markdown"}
1 + 2 = <?lua 1 + 2 ?>
```

> <div id="output">
>
> 1 + 2 = 3
>
> </div>
