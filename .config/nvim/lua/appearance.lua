-- Configure theme
local selected_theme = 'kanagawa-wave'
vim.cmd('colorscheme '  .. selected_theme)
vim.g.colorscheme=selected_theme

-- Enable terminal colors
vim.cmd([[
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
]])


-- Airline appearance is managed in `vim/airline.vim`
