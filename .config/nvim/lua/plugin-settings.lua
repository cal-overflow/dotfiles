-- Configure vim-markdown plugin
vim.g.vim_markdown_folding_disabled=1
vim.g.vim_markdown_frontmatter=1

-- Enable/Configure hard mode
vim.g.HardMode_level='wannabe'
vim.g.HardMode_hardmodeMsg='Arrow Keys = 💩'
vim.cmd('autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()')

-- Configure gitdiff
require("diffview").setup({
  use_icons = false,
})
vim.cmd 'command! Diff DiffviewOpen' -- create alias


-- Configure telescope
require('telescope').setup({
  pickers = {
    find_files = {
      hidden = true,
    },
  },
})
