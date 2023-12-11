
set encoding=utf-8
set updatetime=300



" nvim-telescope plugin commands
" I'm still deciding which of these mappings I like best.
" Option 1:
noremap <S-Tab> :Telescope<CR>
noremap <Tab> :Telescope find_files<CR>

" Option 2:
noremap tt :Telescope<CR>
noremap tf :Telescope find_files<CR>



" COC (Conquer of Completion) plugin config/mappings
" Uses 'tab' button for completion
" set signcolumn=yes
" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ CheckBackspace() ? '\<Tab>' :
"       \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : '\<C-h>'
" function! CheckBackspace() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"

