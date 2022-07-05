local templates = require("qt.templates")
local Input = require("nui.input")
local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event
local utils = require("qt.utils")

local function get_path(question, cb)
  local path = vim.fs.normalize(vim.fn.expand('%:p:h', nil, "") .. "/")
  local input = Input({
    position = "50%",
    size = {
      width = 80,
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
    default_value = path,
    on_submit = function(value)
      if value ~= path then
        cb(value)
      end
    end,
  })

  input:mount()

  input:on(event.BufLeave, function()
    input:unmount()
  end)
  input:map("n", "<Esc>", input.input_props.on_close, { noremap = true })
end

local function get_parent_class(cb)
  local menu = Menu({
    position = "50%",
    size = {
      width = 30,
      height = 3,
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
      cb(vim.inspect(item.text))
    end,
  })

  menu:mount()
  menu:on(event.BufLeave, menu.menu_props.on_close, { once = true })
end

local function revert_changes()
  -- TODO
end

local function create_files(value, parent_class)
  local path, class_name = utils.split(value)

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
    -- Open file
    local ok, fd = pcall(vim.loop.fs_open, utils.join_path(path, file), "w", 420)
    if not ok then
      utils.notify("Class could not be created!")
      err = true
      break
    end

    -- Write content
    ok = pcall(vim.loop.fs_write, fd, content[name], 0, nil)
    if not ok then
      utils.notify("Class could not be created!")
      err = true
      break
    end

    vim.loop.fs_close(fd)
  end

  if err then
    revert_changes()
    return
  end
  -- Open header
  vim.cmd("e " .. utils.join_path(path, files.header))
end

local function create_ui_class()
  get_path("Qt UI class name?", function(new_path)
    local err = false
    for _, extension in pairs({ "ui", "cpp", "h" }) do
      if utils.file_exists(new_path .. "." .. extension) then
        err = true
      end
    end
    if err then
      utils.notify("Class already exists!")
      return
    end
    get_parent_class(function(parent)
      if not parent then
        return
      end
      create_files(new_path, parent:sub(2, -2))
    end)
  end)
end

return create_ui_class
