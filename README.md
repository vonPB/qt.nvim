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

### Configuration
```lua
require('qt').setup()
require('qt').keymaps()
```

## Usage

| Command |  Keybind   | Description |
| ------- | ---------- | ----------- |
| `Qt CreateUIClass` | `<Leader>Qu` | Creates a .h, .cpp and .ui file in current directory with class name and parent class set |


## Support
* [nvim NVIM v0.8.0-dev](https://github.com/neovim/neovim/releases/tag/nightly)
* [Qt 5.15.2](https://www.qt.io/)

### ToDo

- [x] add hotkey
- [x] check for path in class names (must exist)
- [ ] add function to open ui files in Qt Designer

