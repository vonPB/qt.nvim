## qt.nvim
Qt helper functions for nvim.

<img width="525" alt="image" src="https://user-images.githubusercontent.com/65032978/166718514-1a7ea6b4-d25f-4b2e-93bc-9d7d6c11ee12.png">

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
vim.api.nvim_set_keymap('n', 'Q', '<cmd>lua require("qt").create_ui_class()<CR>', {})
```

### Functions
| Function | Description |
| -------- | ----------- |
| `create_ui_class` | create .h, .cpp and .ui files in current dir |


## Support

currently only tested on:
* [nvim NVIM v0.8.0-dev](https://github.com/neovim/neovim/releases/tag/nightly)
* [Qt 5.15.2](https://www.qt.io/)

### ToDo

- [x] add hotkey
- [ ] check for path in class names
- [ ] add function to open ui files in Qt Designer

