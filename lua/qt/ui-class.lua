local templates = require("qt.templates")
local Input = require("nui.input")
local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event

local function get_input(question, callback)
  local input = Input({
    position = "50%",
    size = {
      width = 30,
      height = 2,
    },
    border = {
      style = "single",
      text = {
        top = question,
        top_align = "center",
      },
    },
    win_options = {
      winblend = 10,
      winhighlight = "Normal:Normal",
    },
  }, {
    prompt = "> ",
    default_value = "",
    on_submit = function(value)
      callback(value)
    end,
  })

  input:mount()

  input:on(event.BufLeave, function()
    input:unmount()
  end)
  input:map("n", "<Esc>", input.input_props.on_close, { noremap = true })
end

local function get_parent_class(callback)
  local menu = Menu({
    position = "50%",
    size = {
      width = 30,
      height = 4,
    },
    relative = "editor",
    border = {
      style = "single",
      text = {
        top = "Select parent class",
        top_align = "center",
      },
    },
    win_options = {
      winblend = 10,
      winhighlight = "Normal:Normal",
    },
  }, {
    lines = {
      Menu.item("QWidget"),
      Menu.item("QDialog"),
      Menu.item("QMainWindow"),
    },
    max_width = 20,
    keymap = {
      focus_next = { "j", "<Down>", "<Tab>" },
      focus_prev = { "k", "<Up>", "<S-Tab>" },
      close = { "<Esc>", "<C-c>" },
      submit = { "<CR>", "<Space>" },
    },
    on_submit = function(item)
      callback(vim.inspect(item.text))
    end,
  })

  menu:mount()
  menu:on(event.BufLeave, menu.menu_props.on_close, { once = true })
end

local function revert_changes()
  -- TODO
end

local function create_files(class_name, parent_class)
  local files = {
    header = class_name .. ".h",
    implementation = class_name .. ".cpp",
    ui = class_name .. ".ui",
  }

  local content = {
    header = templates.header(class_name, parent_class),
    implementation = templates.implementation(class_name, parent_class),
    ui = templates.ui(class_name, parent_class),
  }

  local err
  for name, file in pairs(files) do
    local ok, fd = pcall(vim.loop.fs_open, file, "w", 420)
    if not ok then
      vim.api.nvim_err_writeln("Class could not be created!")
      err = true
      break
    end

    ok = pcall(vim.loop.fs_write, fd, content[name], 0, nil)
    if not ok then
      vim.api.nvim_err_writeln("Class could not be written to!")
      err = true
      break
    end

    vim.loop.fs_close(fd)
  end

  if err then
    revert_changes()
    return
  end

  vim.cmd("e " .. files.header)
end

local function create_ui_class()
  get_input("Qt UI class name?", function(class_name)
    if not class_name then
      return
    end

    get_parent_class(function(parent)
      if not parent then
        return
      end
      create_files(class_name, parent:sub(2, -2))
    end)
  end)
end

return create_ui_class
