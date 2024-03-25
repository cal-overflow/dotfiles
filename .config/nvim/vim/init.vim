" Load all vim scripts in this folder
let files = [
\ 'airline.vim',
\ 'mappings.vim',
\]

let path = '~/.config/nvim/vim/'

for file in files
  exec 'source' path . file
endfor
