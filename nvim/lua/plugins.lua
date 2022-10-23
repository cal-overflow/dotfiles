local Plug = vim.fn['plug#']

vim.call('plug#begin')
    -- Utilities
    Plug('jiangmiao/auto-pairs')
    Plug('preservim/nerdtree')
    Plug('ap/vim-css-color')
    Plug('preservim/nerdcommenter')

    -- Appearance
    Plug('vim-airline/vim-airline')
    Plug('vim-airline/vim-airline-themes')
    Plug('sonph/onehalf', { rtp = 'vim' })

    -- Git
    Plug('airblade/vim-gitgutter')
vim.call('plug#end')

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
