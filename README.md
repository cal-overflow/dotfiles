# .config
Some of my configuration files.


## Neovim
Included are my [Neovim](https://neovim.io) config files.

If you're interested in installing and configuring Neovim for yourself, I recommend checking out [neovim.io](https://neovim.io/) for instructions on getting started. \
Some additional resources I've found helpful:
- [Elves Sousa - My basic Neovim setup](https://dev.to/elvessousa/my-basic-neovim-setup-253l)
- [Rio Nyx - Neovim configuration for beginners](https://medium.com/geekculture/neovim-configuration-for-beginners-b2116dbbde84)
- Lua configuration resources
  - [Heiker Curiel - Configuring Neovim using Lua](https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/)
  - [Meet Rajesh Gor - Configure Neovim in Lua
](https://dev.to/mr_destructive/configure-neovim-in-lua-4can)
#### Neovim Configuration
To configure neovim, edit the configuration file located at `~/.config/nvim/init.lua`. \
Recall: The `~/.vimrc` file is **not** used by Neovim.

##### Managing Plugins
Plugins are configured within `~/.config/nvim/lua/plugins.lua`. \
A plugin manager must be used in order for plugins to be installed and function correctly. I use [vim-plug](https://github.com/junegunn/vim-plug) for managing plugins. The essential commands are listed below.

```bash
# Install all plugins
:PlugInstall

# remove plugins that have been removed from the configuration
:PlugClean
```
