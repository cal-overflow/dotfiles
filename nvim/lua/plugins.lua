local Plug = vim.fn['plug#']

vim.call('plug#begin')
-- Plug.begin()

    -- file management
    Plug('preservim/nerdtree')

    -- Utilities
    Plug('jiangmiao/auto-pairs')
    Plug('ap/vim-css-color')
    Plug('preservim/nerdcommenter')
    -- Plug('iamcco/markdown-preview.nvim', { 'do' = 'cd app && yarn install' })

    -- Git
    Plug('airblade/vim-gitgutter')

    -- Appearance
    Plug('tanvirtin/monokai.nvim')
    Plug('vim-airline/vim-airline')

-- Plug.ends()
vim.call('plug#end')
