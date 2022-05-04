local create_ui_class = require('qt.ui-class')

local function setup()
  if package.loaded['which-key'] then
    local wk = require('which-key')

    wk.register({
      ["<Leader>"] = {
        c = {
          name = "+Qt",
          u = { "<cmd>lua require('qt').create_ui_class()<CR>", "Create UI class" },
        },
      },
    })

    return
  end

  vim.api.nvim_set_keymap("n", "<Leader> cu", "<cmd> lua require('qt').create_ui_class()<CR>", {})
end

return {
  create_ui_class = create_ui_class,
  setup = setup
}
