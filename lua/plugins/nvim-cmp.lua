local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  },
  sources = {
    { name = 'nvim_lsp' }, 
    { name = 'luasnip' },     
    { name = 'buffer' },     
    { name = 'path' },      
  },
})

local lspconfig = require('lspconfig')
lspconfig.ts_ls.setup({
    on_attach = function(client, bufnr)
        vim.keymap.set('n', 'Gd', vim.lsp.buf.definition, { noremap = true, silent = true })
    end
})

lspconfig.tailwindcss.setup({
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})
