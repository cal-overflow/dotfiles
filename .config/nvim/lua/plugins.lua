local Plug = vim.fn['plug#']

vim.call('plug#begin')
    -- Utilities
    Plug('jiangmiao/auto-pairs')
    Plug('preservim/nerdtree')
    Plug('ap/vim-css-color')
    Plug('preservim/nerdcommenter')
    Plug('godlygeek/tabular')
    Plug('plasticboy/vim-markdown') -- Note tabular MUST be defined before this
    Plug('mg979/vim-visual-multi', { branch = 'master' })
    Plug('neoclide/coc.nvim', {branch = 'release'})

    -- Appearance
    Plug('vim-airline/vim-airline')
    Plug('vim-airline/vim-airline-themes')
    Plug('sonph/onehalf', { rtp = 'vim' })

    -- Git
    Plug('airblade/vim-gitgutter')

    -- Fun
    Plug('wakatime/vim-wakatime')
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
