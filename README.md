# Neovim Config - Fresh Start

A minimal, modern Neovim configuration built from scratch.

## Structure

```
.
├── init.lua                 # Entry point
├── lua/
│   ├── core/
│   │   ├── options.lua      # Vim options
│   │   ├── keymaps.lua      # Key mappings
│   │   └── autocmds.lua     # Autocommands
│   └── plugins/
│       └── init.lua         # Plugin specifications
└── README.md
```

## Plugins

- **Colorscheme**: tokyonight.nvim
- **Syntax**: nvim-treesitter
- **File Explorer**: mini.files
- **Fuzzy Finder**: telescope.nvim
- **LSP**: nvim-lspconfig + mason.nvim
- **Completion**: nvim-cmp
- **Status Line**: lualine.nvim
- **Git**: gitsigns.nvim
- **Keymap Helper**: which-key.nvim

## Keymaps

### General
- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>Q` - Force quit all
- `<Esc>` - Clear search highlighting

### Navigation
- `<C-h/j/k/l>` - Window navigation
- `<C-d/u>` - Scroll and center cursor
- `n/N` - Next/previous search result (centered)

### Buffers
- `<leader>bn` - Next buffer
- `<leader>bp` - Previous buffer
- `<leader>bd` - Delete buffer

### Telescope
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Find buffers
- `<leader>fh` - Help tags

### LSP
- `gd` - Go to definition
- `gr` - Show references
- `K` - Hover documentation
- `<leader>rn` - Rename
- `<leader>ca` - Code action
- `<leader>f` - Format

### File Explorer
- `<leader>e` - Open mini.files

## Installation

1. Backup your existing config:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. Clone this repository:
   ```bash
   git clone https://github.com/fislysandi/nvim-config-fresh.git ~/.config/nvim
   ```

3. Start Neovim:
   ```bash
   nvim
   ```

   lazy.nvim will automatically install all plugins on first start.

## Requirements

- Neovim 0.9+
- Git
- A Nerd Font (for icons)
