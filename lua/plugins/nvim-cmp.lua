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

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.tailwindcss.setup({
    capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({
  cmd = { "/home/sunkung-ml4w/.local/bin/rust-analyzer" },
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
    }
  }
})

lspconfig.prismals.setup({
  filetypes = { "prisma" },
})

lspconfig.solidity_ls.setup({
    cmd = { "nomicfoundation-solidity-language-server", "--stdio" }, 
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        vim.keymap.set('n', 'Gd', vim.lsp.buf.definition, { noremap = true, silent = true, buffer = bufnr })
    end,
    filetypes = { "solidity" },
    settings = {
        solidity = {
            includePath = "node_modules",
            remapping = {
                ["@openzeppelin/"] = "node_modules/@openzeppelin/"
            }
        }
    }
})
