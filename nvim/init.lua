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

set.splitbelow=true
set.splitright=true
set.title=true
set.ttimeoutlen=0
set.wildmenu=true

-- Tabs size
set.expandtab=true
set.shiftwidth=2
set.tabstop=4

-- Plugin configurations
vim.g.NERDTreeShowHidden=1 -- Show hidden files
vim.g.NERDTreeHijackNetrw=1 -- Hijack :Ex, :Rex,... commands to use NerdTree instead of Netrw

-- Require modules
require('plugins')

