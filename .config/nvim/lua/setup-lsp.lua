vim.cmd 'command! CocInstall coc-clangd'
vim.cmd 'command! CocInstall coc-cmake'
vim.cmd 'command! CocInstall coc-css'
vim.cmd 'command! CocInstall coc-eslint'
vim.cmd 'command! CocInstall coc-html'
vim.cmd 'command! CocInstall coc-java-language-server'
vim.cmd 'command! CocInstall coc-json'
vim.cmd 'command! CocInstall coc-marksman' -- markdown
vim.cmd 'command! CocInstall coc-pyright' -- Python
vim.cmd 'command! CocInstall coc-rust-analyzer'
vim.cmd 'command! CocInstall coc-sh' -- bash
vim.cmd 'command! CocInstall coc-sumneko-lua'
vim.cmd 'command! CocInstall coc-tsserver' -- TypeScript/JavaScript

require('lspconfig').clangd.setup{}
require('lspconfig').cmake.setup{}
require('lspconfig').html.setup{}
require('lspconfig').java_language_server.setup{}
require('lspconfig').jsonls.setup{}
require('lspconfig').pyright.setup{} -- Python
require('lspconfig').rust_analyzer.setup{}
require('lspconfig').bashls.setup{} -- bash
require('lspconfig').lua_ls.setup{}
require('lspconfig').tsserver.setup{} -- TypeScript/JavaScript
