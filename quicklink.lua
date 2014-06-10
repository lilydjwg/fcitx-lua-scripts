#!/usr/bin/env lua

function wikipediaEn(s)
  print(s)
  return 'https://en.wikipedia.org/wiki/' .. s
end

function wikipediaZh(s)
  --TODO: 编码->中文
  return 'https://zh.wikipedia.org/wiki/' .. ime.get_last_commit()
end

local linkmap = {
  zh = wikipediaZh,
  en = wikipediaEn,
}

function QuickLink(input)
  if #input < 2 then return {} end
  local code = string.sub(input, 1, 2)
  local s = string.sub(input, 3)
  print(code, s, tostring(linkmap.en))
  if linkmap[code] then
    return linkmap[code](s)
  end
  return {}
end

ime.register_command("ql", "QuickLink", "快速链接")
