-- Configure lsp-zero
local lsp_zero = require('lsp-zero').preset({})

lsp_zero.on_attach(function(client, bufnr)
  -- :help lsp-zero-keybindings for available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp_zero.nvim_lua_ls())
require('lspconfig').lua_ls.setup(lsp_zero.nvim_lua_ls())

lsp_zero.setup()

-- Settings for each language server
-- Only add servers here that have custom settings
-- NOTE: in order for these settings to take effect, must declare the use of custom_server_handler for Mason (see below).
local server_settings = {
  jsonls = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
  yamlls = {
    -- TODO complete setting up yaml ls settings
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
      -- completion = true,
      -- customTags = {
      --   "!Ref",
      --   "!GetAtt",
      --   "!Sub",
      -- }
    },
  },
}


local capabilities = require('cmp_nvim_lsp').default_capabilities();

local function custom_server_handler(server_name)
  require('lspconfig')[server_name].setup({
    capabilities = capabilities,
    settings = server_settings[server_name],
    on_attach = function(client, _)
      client.server_capabilities.documentFormattingProvider = true
      print('LSP ' .. server_name .. ' attached') -- nice to have for debugging custom servers
    end
  })
end


-- Configure mason
require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {}, -- Managed in setup script for simpler setup/management
  handlers = {
    lsp_zero.default_setup,
    -- Servers with custom settings must use the custom_server_handler to pass settings
    yamlls = custom_server_handler,
    jsonls = custom_server_handler,
  }
})

