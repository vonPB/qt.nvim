local create_ui_class = require("qt.ui-class")

local function handle_command(opts)
  if opts.args == "CreateUIClass" then
    create_ui_class()
  end
end

return handle_command
