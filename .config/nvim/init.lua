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

set.splitbelow=true
set.splitright=true
set.title=true
set.ttimeoutlen=0
set.wildmenu=true

-- Tabs size
set.expandtab=true
set.shiftwidth=2
set.tabstop=4

-- Enable NERDTree and disable Netrw
vim.g.NERDTreeShowHidden=1 -- Show hidden files
vim.g.NERDTreeHijackNetrw=1
-- vim.g.NERDTreeShowLineNumbers=0

-- Enable undo across neovim sessions
vim.opt.undofile=true

-- Require modules
require('plugins')

-- Load mappings
vim.cmd('so ~/.config/nvim/mappings.vim')


