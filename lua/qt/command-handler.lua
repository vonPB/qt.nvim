local create_ui_class = require("qt.ui-class")

local function get_file_path()

end

local function handle_command(opts)
  if opts.args == "CreateUIClass" then
    create_ui_class()
    -- print("Path: " .. vim.cmd([[echo expand('%p:h:t')]]))
    -- print("All " .. vim.api.nvim_buf_get_name(0))
    -- local file = string.gsub(vim.api.nvim_buf_get_name(0), vim.loop.cwd(), '')

    -- print(file)
    -- local ok, fd = pcall(vim.loop.fs_open, file, "w", 420)
    -- if not ok then
    --   vim.api.nvim_err_writeln("Class could not be created!")
    -- end

    -- ok = pcall(vim.loop.fs_write, fd, "new file content blablalba", 0, nil)
    -- if not ok then
    --   vim.api.nvim_err_writeln("Class could not be written to!")
    -- end

    -- vim.loop.fs_close(fd)
  end
end

return handle_command
