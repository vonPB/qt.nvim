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

" Somwhere after plugins are loaded
lua require('qt').setup()
```

Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
    'vonpb/qt.nvim',
    config = function()
      require('qt').setup()
  }
```

## Usage

|  Keybind   | Function | Description |
| ---------- | -------- | ----------- |
| `<Leader>cu` | `create_ui_class` | Creates a .h, .cpp and .ui file in current directory with class name and parent class set |


## Support

* [nvim NVIM v0.8.0-dev](https://github.com/neovim/neovim/releases/tag/nightly)
* [Qt 5.15.2](https://www.qt.io/)

### ToDo

- [x] add hotkey
- [ ] check for path in class names
- [ ] add function to open ui files in Qt Designer
