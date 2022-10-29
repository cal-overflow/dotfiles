# .config
Some of my configuration files.

## [zsh](https://www.zsh.org/)
Zsh jazzed up with [Oh my ZSH](https://ohmyz.sh/) is my shell of choice.

## [Neovim](https://neovim.io)

Resources I've found helpful while learning Neovim:
- [Elves Sousa - My basic Neovim setup](https://dev.to/elvessousa/my-basic-neovim-setup-253l)
- [Rio Nyx - Neovim configuration for beginners](https://medium.com/geekculture/neovim-configuration-for-beginners-b2116dbbde84)
- [Lua](https://www.lua.org/) config resources
  - [Heiker Curiel - Configuring Neovim using Lua](https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/)
  - [Meet Rajesh Gor - Configure Neovim in Lua
](https://dev.to/mr_destructive/configure-neovim-in-lua-4can)

### Notes to self
##### Neovim Configuration
To configure neovim, edit the configuration file located at `~/.config/nvim/init.lua`. \
Recall: The `~/.vimrc` file is **not** used by Neovim.

##### Managing Plugins
Plugins are configured within `~/.config/nvim/lua/plugins.lua`. \
A plugin manager must be used in order for plugins to be installed and function correctly. I use [vim-plug](https://github.com/junegunn/vim-plug) for managing plugins. The essential commands are listed below.

```vim
# Install plugins
:PlugInstall

# Cleanup unused plugins
:PlugClean
```

##### Lua
Some "translations" from regular vim config to lua that may be helpful:
| vim | lua |
| :-: | :-: |
| `let g:variable='value'` | `vim.g.variable='value'` |

##### Other dependencies
The following dependencies may be needed for neovim to work properly.
- LTS node
  - pyright npm package

