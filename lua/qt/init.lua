local create_ui_class = require("qt.ui-class")
local handle_command = require("qt.command-handler")
local M = {}

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
        return { 'CreateUIClass' }
      end,
    })
end

function M.keymaps()
  -- Lunarvim
  if os.getenv "LUNARVIM_BASE_DIR" then
    lvim.builtin.which_key.mappings["Q"] = {
      name = "+Qt",
      u = { "<cmd>lua require('qt').create_ui_class()<CR>", "Create UI class" },
    }
    return
  end

  --- Which_key
  if package.loaded['which-key'] then
    local wk = require('which-key')

    wk.register({
      ["<Leader>"] = {
        Q = {
          name = "+Qt",
          u = { "<cmd>lua require('qt').create_ui_class()<CR>", "Create UI class" },
        },
      },
    })

    return
  end

  -- Native
  vim.api.nvim_set_keymap("n", "<Leader> qu", "<cmd> lua require('qt').create_ui_class()<CR>", {})
end

return M
