-- Find the complete setup process at https://github.com/cal-overflow/dotfiles

-- Options
local set = vim.opt

set.background='dark'
set.clipboard='unnamedplus'
set.completeopt='noinsert,menuone,noselect'
set.cursorline=true
set.hidden=true
set.inccommand='split'
set.mouse='a'
set.number=true
set.relativenumber=true
set.modifiable=true
set.guicursor='n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkon1'
set.spell=true

set.showmode=false
set.splitbelow=true
set.splitright=true
set.title=true
set.ttimeoutlen=0
set.wildmenu=true


-- Tabs size
set.expandtab=true
set.shiftwidth=2
set.tabstop=4


-- Enable undo across neovim sessions
vim.opt.undofile=true

-- Load `vim/` scripts
vim.cmd('so ~/.config/nvim/vim/init.vim')

-- Load `lua/` scipts
require('init') -- Loads from `~/.config/nvim/lua`
-- require('telescope-themes') -- TODO figure out what's going on here

