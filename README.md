# .config
Some of my configuration files.

## Automated setup
I've created a bash script that installs all of my preferred tools and saves my configuration locally. \
To run the script, simply run the following command.
```bash
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/cal-overflow/dotfiles/main/setup.sh)" && source ~/.zshrc
```

<small>Note, this has only been tested on unix-based operating systems with zsh installed.</small>


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

##### Other helpful resources
- [multiline editing (multi-cursor alternative) - Stack Overflow](https://stackoverflow.com/questions/11784408/vim-multiline-editing-like-in-sublimetext)


## Keyboard
I have saved my custom keyboard firmware (GMK) configuration in this repository. You can learn more about how to compile and flash onto a compatible keyboard [here](https://docs.qmk.fm/#/newbs).
