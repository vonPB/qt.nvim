## qt.nvim

Qt helper functions for nvim.

## Getting Started

### Dependencies

- [nui.nvim](https://github.com/MunifTanjim/nui.nvim)

#### Optional

- [which-key](https://github.com/folke/which-key.nvim)

### Installation

Using [vim-plug](https://github.com/junegunn/vim-plug)

```viml
Plug 'vonpb/qt.nvim'
```

Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use { 'vonpb/qt.nvim' }
```

## Usage


### Keymaps

#### Which-key

```lua
local wk = require('which-key')

wk.register({
  Q = {
    name = "+Qt",
    u = { "<cmd>lua require('qt').create_ui_class()<CR>", "Create UI class" },
  },
}, { prefix = "<leader>"})
```


#### [LunarVim](https://github.com/LunarVim/LunarVim)

```lua
lvim.builtin.which_key.mappings["Q"] = {
  name = "+Qt",
  u = { "<cmd>lua require('qt').create_ui_class()<CR>", "Create UI class" },
}
```

#### nvim api

```lua
vim.api.nvim_set_keymap('n', 'Q', '<cmd>lua require("qt".create_ui_class()<CR>', {}))
```

### Functions
| Function | Description |
| -------- | ----------- |
| `create_ui_class` | Creates a .h, .cpp and .ui file in current directory with class name and parent class set |


## Support

currently only tested on:
* [nvim NVIM v0.8.0-dev](https://github.com/neovim/neovim/releases/tag/nightly)
* [Qt 5.15.2](https://www.qt.io/)

### ToDo

- [x] add hotkey
- [ ] check for path in class names
- [ ] add function to open ui files in Qt Designer
