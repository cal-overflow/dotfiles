" Options
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set inccommand=split
set mouse=a " this is what enables mouse interaction :)
set number

set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu

" Tabs size
set expandtab
set shiftwidth=2
set tabstop=4

let NERDTreeShowHidden=1 " Show hidden files

" Plugins
call plug#begin()
    " file management
    Plug 'preservim/nerdtree'

    " Utilities
    Plug 'jiangmiao/auto-pairs'
    Plug 'ap/vim-css-color'
    Plug 'preservim/nerdcommenter'
    " Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
call plug#end()



" Mappings

