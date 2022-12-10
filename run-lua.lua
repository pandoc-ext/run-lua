local function run_lua (cmd, constr)
  -- allow `=` as a shorthand for `return`.
  cmd = cmd:gsub('^%s*=', 'return ')
  local success, result = pcall(
    function ()
      return load(cmd)()
    end
  )
  if not success then return tostring(result) end

  local elements
  success, elements = pcall(constr, result)
  return success
    and elements
    or select(2, pcall(tostring, result))
end

local function get_code (str)
  return str:match '^%<%?lua (.*)%?%>'
end

function RawInline (raw)
  local code = get_code(raw.text)
  if code and raw.format:match '^html' then
    return run_lua(code, pandoc.Inlines)
  end
end
