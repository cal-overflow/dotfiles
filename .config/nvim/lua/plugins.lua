local Plug = vim.fn['plug#']

vim.call('plug#begin')
    -- Utilities
    Plug('jiangmiao/auto-pairs')
    Plug('preservim/nerdtree')
    Plug('ap/vim-css-color')
    Plug('preservim/nerdcommenter')
    Plug('godlygeek/tabular')
    Plug('plasticboy/vim-markdown') -- Note tabular MUST be defined before this
    Plug('neoclide/coc.nvim', {branch = 'release'})
    Plug('tpope/vim-surround')

    -- LSP (Language Server)
    Plug('neovim/nvim-lspconfig')

    -- Appearance
    Plug('vim-airline/vim-airline')
    Plug('vim-airline/vim-airline-themes')
    Plug('sonph/onehalf', { rtp = 'vim' })

    -- Git
    Plug('airblade/vim-gitgutter')

    -- Fun
    Plug('wakatime/vim-wakatime')

    -- "Hard mode" lol (allows for disabling arrow keys)
    Plug('wikitopian/hardmode')

vim.call('plug#end')

-- Configure NERDTree - these commands are from the plugin's GitHub repo
vim.cmd([[
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
]])
vim.cmd([[
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
]])

-- Configure vim-markdown plugin
vim.g.vim_markdown_folding_disabled=1
vim.g.vim_markdown_frontmatter=1

-- Configure theme (onehalf-dark)
vim.cmd('colorscheme onehalfdark')
vim.g.colorscheme='onehalfdark'
vim.g.airline_theme='onehalfdark'
vim.cmd([[
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
]])

-- Configure LSP
require('lspconfig').pyright.setup{}


-- Configure suggestions/autocomplete (Conquerer of Completion)
local keyset = vim.keymap.set
-- Configure to use tab to autocomplete
-- Auto complete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Enable/Configure hard mode
vim.g.HardMode_level='wannabe'
vim.g.HardMode_hardmodeMsg='Arrow Keys = 💩'
vim.cmd('autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()')

