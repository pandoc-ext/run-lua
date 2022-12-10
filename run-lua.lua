local function run_lua (cmd)
  local success, thunk = pcall(load, cmd)
  if success then
    local result
    success, result = pcall(thunk)
    return type(result) == 'number'
      and tostring(result)
      or result
  else
    -- return error message
    return thunk
  end
end

local function get_code (str)
  return str:match '^%<%?lua (.*)%?%>'
end

function RawInline (raw)
  local code = get_code(raw.text)
  if code and raw.format:match '^html' then
    return run_lua(code)
  end
end
