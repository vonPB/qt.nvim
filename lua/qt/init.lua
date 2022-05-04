local create_ui_class = require('qt.ui-class')

local function setup()
  vim.api.nvim_set_keymap('n', '<Leader>qu', '<cmd> lua require("qt").create_ui_class()<CR>', {})
end

return {
  create_ui_class = create_ui_class,
  setup = setup
}
