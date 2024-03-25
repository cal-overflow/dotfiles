-- Configure vim-markdown plugin
vim.g.vim_markdown_folding_disabled=1
vim.g.vim_markdown_frontmatter=1

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
