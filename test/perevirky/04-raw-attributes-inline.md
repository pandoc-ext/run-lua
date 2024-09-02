Raw attributes syntax with format `run-lua` or `runlua` can be
used as an alternative to the processing-instructions-based
syntax.

For example,

``` markdown {#input}
𝜋 ≈ `math.pi`{=run-lua}

𝜏 ≈ `2 * math.pi`{=runlua}
```

yields

> <div id="output">
>
> 𝜋 ≈ 3.1415926535898
>
> 𝜏 ≈ 6.2831853071796
>
> </div>

**Note** that pandoc isn't an XML processor, and the processing
instruction is terminated by a single `>`. Use the “raw attribute”
syntax if your code contains that character:

    ```{=runlua}
    return 1 > 0 and 'all is well'
    ```
