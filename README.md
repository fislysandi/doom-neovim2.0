<div align="center">
  <h1>doom-neovim2.0</h1>
  <p>A powerful, Doom Emacs-inspired Neovim configuration built with Lua.</p>
  <p>
    <img alt="License" src="https://img.shields.io/badge/License-GPLv3-blue.svg?style=for-the-badge" />
    <img alt="Neovim version" src="https://img.shields.io/badge/Neovim-0.8+-57A143?style=for-the-badge&logo=neovim" />
  </p>
</div>

## 1. Introduction

**doom-neovim2.0** is a personal Neovim configuration designed to provide a "Doom Emacs" experience—keyboard-centric, fast, and feature-rich. It is optimized for cross-platform use (macOS, Linux, Windows) and managed via [Nutuck](https://github.com/fislysandi/nutuck).

Sourced and adapted from [ntk148v/neovim-config](https://github.com/ntk148v/neovim-config).

## 2. Features

- **Blazing Fast**: Uses `lazy.nvim` for deferred plugin loading.
- **Doom Mappings**: Space-based leader key with structured groups (`SPC f` for files, `SPC b` for buffers, etc.).
- **LSP & Autocomplete**: Powered by `mason.nvim`, `nvim-lspconfig`, and `nvim-cmp`.
- **Treesitter**: High-performance syntax highlighting and code navigation.
- **Telescope**: Unified interface for searching files, buffers, git, and help.
- **File Manager**: Uses `mini.files` for a unique, intuitive file system navigation.
- **Appearance**: Defaults to the elegant `rose-pine` theme.

## 3. Installation

This configuration is intended to be used as part of a dotfiles repository managed by [Nutuck](https://github.com/fislysandi/nutuck).

### Manual Installation

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone doom-neovim2.0
git clone https://github.com/fislysandi/doom-neovim2.0.git ~/.config/nvim
```

## 4. Keymaps (Highlights)

| Shortcut | Description |
| :--- | :--- |
| `<leader> SPC` | Find file in project |
| `<leader> /` | Search project (Live Grep) |
| `<leader> ,` | Switch buffer |
| `<leader> .` | Browse files (current folder) |
| `<leader> h k` | **View all keybindings** (Help menu) |
| `<leader> c c` | Toggle comment (Doom-style) |
| `<leader> o t` | Open terminal |
| `<leader> f s` | Save file |
| `Ctrl + j/k` | Navigate completion and search menus |

## 5. Customization

You can extend this configuration by creating a `lua/custom.lua` file. Check `lua/sample_custom.lua` for an example of how to add extra plugins and settings without modifying the core files.

---

**Original Author**: [Kien Nguyen Tuan](https://github.com/ntk148v)  
**License**: GPLv3
