vim.cmd 'command! CocInstall coc-clangd'
vim.cmd 'command! CocInstall coc-cmake'
vim.cmd 'command! CocInstall coc-eslint'
vim.cmd 'command! CocInstall coc-java-language-server'
vim.cmd 'command! CocInstall coc-marksman' -- markdown
vim.cmd 'command! CocInstall coc-pyright' -- Python
vim.cmd 'command! CocInstall coc-rust-analyzer'
vim.cmd 'command! CocInstall coc-sh' -- bash
vim.cmd 'command! CocInstall coc-sumneko-lua'
vim.cmd 'command! CocInstall coc-tsserver' -- TypeScript/JavaScript

-- Grant autocomplate capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').clangd.setup{ capabilities = capabilities }
require('lspconfig').cmake.setup{ capabilities = capabilities }
require('lspconfig').java_language_server.setup{ capabilities = capabilities }
require('lspconfig').html.setup{ capabilities = capabilities }
require('lspconfig').cssls.setup{ capabilities = capabilities }
require('lspconfig').jsonls.setup{ capabilities = capabilities }
require('lspconfig').pyright.setup{ capabilities = capabilities } -- Python
require('lspconfig').rust_analyzer.setup{ capabilities = capabilities }
require('lspconfig').bashls.setup{ capabilities = capabilities } -- bash
require('lspconfig').lua_ls.setup{ capabilities = capabilities }
require('lspconfig').tsserver.setup{ capabilities = capabilities } -- TypeScript/JavaScript
