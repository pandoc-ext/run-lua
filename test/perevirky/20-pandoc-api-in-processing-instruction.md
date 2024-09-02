The Lua code is run in pandoc's own Lua interpreter. It can therefore
make full use of pandoc Lua functions and can create pandoc AST
elements.

Take this code to create a countdown as example:

``` markdown {#input}
<?lua
local result = pandoc.Inlines{}
for i = 10, 0, -1 do
  if 0 < i then
    -- not the end yet
    result:insert(pandoc.Str(tostring(i) .. ','))
    result:insert(pandoc.Space())
  else
    result:insert(pandoc.Str(tostring(i)))
  end
end
return pandoc.Para(result)
?>
```

The generated output is

> <div id="output">
>
> 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0
>
> </div>
