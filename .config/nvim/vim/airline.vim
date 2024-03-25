if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" theme
let g:airline_theme='tomorrow'

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
" If these characters aren't displaying correctly, then powerline fonts is
" probably incorrectly installed
" Another reason is the terminal emulator isn't configured to support powerline.
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '' 
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''


" Tab settings
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=0
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '' 
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'default'

" Enable powerline fonts
let g:airline_powerline_fonts=1

" Misc settings
let g:airline_statusline_ontop=0
let g:airline_detect_spelllang=0
let g:airline_detect_spell=0
" let g:airline_inactive_collapse=1
let g:airline_focuslost_inactive=1
let g:airline_skip_empty_sections=1

" Extensions
let g:airline_extensions = [ 'branch', 'hunks', 'keymap', 'netrw', 'nvimlsp', 'po', 'quickfix', 'searchcount', 'tabline', 'term', 'whitespace', 'wordcount' ]
