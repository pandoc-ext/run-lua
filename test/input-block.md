Countdown:

<?lua
local result = pandoc.Inlines{}
for i = 10, 0, -1 do
  result:insert(pandoc.Str(tostring(i)))
  if 0 < i then
    result:insert(pandoc.Str ',')
    result:insert(pandoc.Space())
  end
end
return pandoc.Para(result)
?>

