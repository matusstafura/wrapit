local M = {}

-- TODO
-- make this configurable a -> target, title, etc; img -> alt, title, etc
-- refactor

M.tag = function(type, string)
  return type(string)
end

M.href = function(string)
  return "<a href=\"" .. string .. "\">" .. string .. "</a>"
end

M.src = function(string)
  return "<img src=\"" .. string .. "\" />"
end

M.get_selection = function()

  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  local text = M.get_selected_text(start_pos, end_pos)

  return text, start_pos, end_pos
end

M.get_selected_text = function(start_pos, end_pos)
  local line = vim.api.nvim_buf_get_lines(0, start_pos[2]-1, end_pos[2], false)
  local text = string.sub(line[1], start_pos[3], end_pos[3])
  return text
end

-- HARDCODED end 4
local function wrap(type)
  local url, start_pos, end_pos = M.get_selection()
  local selCount = string.len(url) + 3
  local replacement = M.tag(type, url)
  local len = end_pos[3] - start_pos[3] - 2

  vim.api.nvim_buf_set_text(0, start_pos[2]-1, start_pos[3]-1, end_pos[2]-1, start_pos[3] + selCount - 4, {replacement})
end

M.link = function()
  return wrap(M.href)
end

M.image = function()
  return wrap(M.src)
end

M.setup = function()
  return wrap(M.href)
end

return M
