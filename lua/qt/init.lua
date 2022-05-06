local M = {}
local create_ui_class = require("qt.ui-class")
local handle_command = require("qt.command-handler")

function M.create_ui_class()
  create_ui_class()
end

function M.setup()
  vim.api.nvim_create_user_command('Qt',
    function(opts)
      handle_command(opts)
    end,
    { nargs = 1,

    complete = function(ArgLead, CmdLine, CursorPos)
      return { 'CreateUIClass', 'Test' }
    end,
  })
end

return M
