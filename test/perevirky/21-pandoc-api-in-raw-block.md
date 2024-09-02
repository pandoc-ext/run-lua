<details>

Of course this also works with raw attribute blocks. The output

> <div id="output">
>
> This uses "raw attributes" syntax.
>
> </div>

can be produced by writing

```` markdown {#input}
```{=run-lua}
return pandoc.Para(
  pandoc.Inlines('This uses ') ..
  {pandoc.Quoted('DoubleQuote', 'raw attributes')} ..
  pandoc.Inlines ' syntax.'
)
```
````

</details>
