# Neovim 0.8 config
My personal nvim configuration for programming everyday. Its blazingly fast, cherry-picked plugins are based on those of [ThePrimeagen](https://github.com/ThePrimeagen/init.lua), written in Lua.

## Core Principles

1. Comfort: I use this everyday, it has to be nice and enjoyable.
2. Fast: it must be *Blazingly fast!!!*
4. Evolutive: I'm constantly improving my workflow adding valuable features and unpluging those which I do not use.

## Installation

1. Clone the repo.
2. Start neovim, ignore the tons of error
3. Run `:PackerInstall`
4. Restart neovim (should get zero errors this time)
5. You're good to go :rainbow:

## General overview

- Most of the bindings are behind `<leader>` which is set to `Space`. Relies on [WhichKeys](https://github.com/folke/which-key.nvim) for discoverability.
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) and [FZF](https://github.com/junegunn/fzf.vim).
- [LSP](https://microsoft.github.io/language-server-protocol/) centric.
- [Treesitter](https://github.com/tree-sitter/tree-sitter) for syntax highlighting and manipulations.
- [DAP](https://github.com/mfussenegger/nvim-dap) for debuggin in nvim.
- Organized as following:
  - `init.lua` bootstrap [Packer](https://github.com/wbthomason/packer.nvim)
  - `lua/emicastro/packer.lua` dependencies and their basic configuration.
  - `lua/emicastro/remap.lua` general mappings, independant of any filetype.
  - `after/plugin` directory for plugin configuration files. One for each plugin.
 That way, to install a new plugin it only needs to be added into `lua/emicastro/packer.lua` and a file called `<plugin_name>.lua` should be created in `after/plugin` directory.
There the plugin's configs need to be added. Then both files need to be sourced and run `:PackerSync` command.

## Languages

List of languages that this configuration accomodates for:

- Go
- Rust
- Lua

## Aesthetics

- Themes: Current theme is `rose-pine` but can change in the future.
- Font: `FiraCode Nerdfont Retina` used from the MacOs iTerm settings, do not specify one just for nvim.
