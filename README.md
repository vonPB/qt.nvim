## qt.nvim

Qt helper functions for nvim.

## Getting Started

### Dependencies

- [nui.nvim](https://github.com/MunifTanjim/nui.nvim)
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)?

### Installation

Using [vim-plug](https://github.com/junegunn/vim-plug)

```viml
Plug 'MunifTanjim/nui.nvim'
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

### Usage

|  Keybind   | Function   |
| ---------- | ---------- |
| `<Leader>qu` | create UI class |

