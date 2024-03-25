-- Autocomplete is achieved with nvim-cmp
local cmp = require('cmp')


cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item({behavior = 'select'}),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
    ['<Enter>'] = cmp.mapping.confirm({select = false}),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

