# Neovim, BTW 😏

My neovim config for a smooth programming experience, everyday.

## Core Principles 🗿

1. Comfort: I use this everyday, it has to be nice and enjoyable.
2. Fast: it must be _Blazingly fast!!!_
3. Evolutive: I'm constantly improving my workflow adding valuable features and unpluging those which I do not use.

## Installation ⏬

You can clone this repo, change whatever you want and build your own setup on top of it.

0. Install [Neovim](https://neovim.io/) _(at least 0.9 version)_
1. Clone this repository.
2. Check you don't have a previous `~/.config/nvim/` directory.
3. Start neovim and let `Lazy` do its magic!
4. You're good to go :rocket:

## General overview 🗺️

- Most of the bindings are behind `<leader>` which is set to `Space`. Relies on [WhichKeys](https://github.com/folke/which-key.nvim) for discoverability.
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) and [FZF](https://github.com/junegunn/fzf.vim).
- [LSP](https://microsoft.github.io/language-server-protocol/) centric.
- [Treesitter](https://github.com/tree-sitter/tree-sitter) for syntax highlighting and manipulations.
- [DAP](https://github.com/mfussenegger/nvim-dap) for debuggin in nvim.
- Organized as following:
  - `init.lua` bootstrap `core` utils (keymaps, options, etc.) and [Lazy](https://github.com/folke/lazy.nvim) along with its plugins.
  - `lua/emicastro/plugins` contains all the plugins and their configuration. You can setup your own configs, remove some plugins you don't want or add new ones.
    - LSP and debbugging (DAP) capabilities are contained in their own subdirectories whitin the `/plugins` directory.
  - `lua/emicastro/core` contains general mappings and neovim options.
  - `lua/emicastro/plugins/init.lua` file contains the url of the plugins that do not need configuration to be initialized.

That way, to install a new plugin it only needs to be added into `lua/emicastro/plugins` as a file usually called `<plugin_name>.lua` and must return a table with its repository's url and a config function.

> You can see the [Lazy](https://github.com/folke/lazy.nvim) repository to see more details about how plugins work or just look into one of the already installed and you'll catch up the ritght way to install them.
> For plugins that do not need a setup, you just add the name of their repository to the `lua/emicastro/plugins/init.lua` file.

You always can run the command `:Lazy` to check the status of your plugins.

## Languages 🗣️

List of languages that this configuration accomodates for:

- Go ( via [go.nvim](https://github.com/ray-x/go.nvim))
- Rust (via [rustaceanvim](https://github.com/mrcjkb/rustaceanvim))
- Lua

I've also included some tools like language parsers, linters or LSP servers for 'c', 'html', 'json', among many others because I use them, but you should not hesitate on remove them if you don't need them.
You can find them in the `lua/emicastro/plugins/treesitter.lua` file where there are plenty of language parsers for highlighting, and in the `lua/emicastro/plugins/mason.lua` for lsp servers, daps and linters.

## Aesthetics ✨

- Themes: Current theme is `rose-pine` but can change in the future.
- Font: `FiraCode Nerdfont Retina` used from the MacOs iTerm settings, do not specify one just for nvim.
