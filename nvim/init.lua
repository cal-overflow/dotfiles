-- Options

local set = vim.opt

set.background=dark
set.clipboard=unnamedplus
set.completeopt=noinsert,menuone,noselect
set.cursorline=true
set.hidden=true
set.inccommand=split
set.mouse=a -- this is what enables mouse interaction :)
set.number=true

set.splitbelow=true
set.splitright=true
set.title=true
set.ttimeoutlen=0
set.wildmenu=true

-- Tabs size
set.expandtab=true
set.shiftwidth=2
set.tabstop=4

-- TODO - figure out how to enable hidden files with nerd tree (now that this is with lua)
vim.g.NERDTreeShowHidden=1 -- Show hidden files

-- Require Plugins module (./lua/plugins.lua')
require('plugins')

