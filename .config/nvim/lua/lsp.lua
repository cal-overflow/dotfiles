-- Configure lsp-zero
local lsp_zero = require('lsp-zero').preset({})

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp_zero.nvim_lua_ls())
require('lspconfig').lua_ls.setup(lsp_zero.nvim_lua_ls())

lsp_zero.setup()


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


vim.lsp.set_log_level('debug') -- TODO remove

-- Server-level settings
local server_settings = {
  tailwindcss = {},
  tsserver = {},
  bashls = {},
  pyright = {},
  jsonls = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
  yamlls = {
    yaml = {
      schemaStore = {
        -- Required for leverageing b0o/schemastore plugin
        enable = false,
        url = "",
      },
      schemas = require('schemastore').yaml.schemas(),
      -- format = {
      --   enable = true,
      -- },
      -- hover = true,
      -- completion = true,
      -- schemas = {
      --   ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
      -- },
      -- customTags = {
      --   -- Cloudformation tags
      --   "!And scalar",
      --   "!If scalar",
      --   "!Not",
      --   "!Equals scalar",
      --   "!Or scalar",
      --   "!FindInMap scalar",
      --   "!Base64",
      --   "!Cidr",
      --   "!Ref",
      --   "!Sub",
      --   "!GetAtt sequence",
      --   "!GetAZs",
      --   "!ImportValue sequence",
      --   "!Select sequence",
      --   "!Split sequence",
      --   "!Join sequence"
      -- },
    },
  },
  terraformls = {},
  marksman = {},
  clangd = {},
}

-- local function on_attach(client, bufnr)
--   client.server_capabilities.documentFormattingProvider = true
--   print(server_name .. ' lsp attached (debug log)') -- TODO remove
-- end


-- Configure mason
require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {}, -- installing these through setup script for simpler setup/management
  handlers = {
    lsp_zero.default_setup,
    function(server_name)
      require('lspconfig')[server_name].setup({
        capabilities = capabilities,
        settings = server_settings[server_settings],
        -- on_attach = on_attach,
        on_attach = function(client, bufnr) -- could move this to variable
          client.server_capabilities.documentFormattingProvider = true
          print('hello.' .. server_name .. ' lsp attached (debug log)') -- TODO remove
        end,
      })
    end,
    -- Just trying to focus on yamlls for now... should remove this
    yamlls = function()
      require('lspconfig').yamlls.setup({
        capabilities = capabilities,
        settings = server_settings['yamlls'],
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = true
          print('hello yaml lang server ') -- TODO remove
          print("settings", server_settings['yamlls']) -- TODO remove
        end
      })
    end,
  }
})





-- OLD
-- Grant autocomplate capabilities
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- 
-- require('lspconfig').clangd.setup{ capabilities = capabilities }
-- require('lspconfig').cmake.setup{ capabilities = capabilities }
-- require('lspconfig').java_language_server.setup{ capabilities = capabilities }
-- require('lspconfig').html.setup{ capabilities = capabilities }
-- require('lspconfig').cssls.setup{ capabilities = capabilities }
-- require('lspconfig').jsonls.setup{ capabilities = capabilities }
-- require('lspconfig').pyright.setup{ capabilities = capabilities } -- Python
-- require('lspconfig').rust_analyzer.setup{ capabilities = capabilities }
-- require('lspconfig').bashls.setup{ capabilities = capabilities } -- bash
-- require('lspconfig').lua_ls.setup{ capabilities = capabilities }
-- require('lspconfig').tsserver.setup{ capabilities = capabilities } -- TypeScript/JavaScript
