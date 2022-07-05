local has_notify, notify = pcall(require, "notify")
local M = {}

function M.file_exists(path)
  local _, error = vim.loop.fs_stat(path)
  return error == nil
end

function M.split(path)
  path = vim.fs.normalize(path)
  local head, tail = string.match(path, "^(.*)/([^/]*)$")
  return head, tail or path
end

function M.join_path(...)
  return table.concat({ ... }, "/")
end

function M.notify(msg)
  vim.schedule(function()
    if has_notify then
      notify(msg, vim.log.levels.WARN, { title = "Qt" })
    else
      vim.notify("[Qt] " .. msg, vim.log.levels.WARN)
    end
  end)
end

return M
