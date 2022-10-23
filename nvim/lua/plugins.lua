local Plug = vim.fn['plug#']

vim.call('plug#begin')
    -- Utilities
    Plug('jiangmiao/auto-pairs')
    Plug('preservim/nerdtree')
    Plug('ap/vim-css-color')
    Plug('preservim/nerdcommenter')
    -- Plug('iamcco/markdown-preview.nvim', { 'do' = 'cd app && yarn install' })

    -- Git
    Plug('airblade/vim-gitgutter')

    -- Appearance
    Plug('tanvirtin/monokai.nvim')
    Plug('vim-airline/vim-airline')

vim.call('plug#end')

