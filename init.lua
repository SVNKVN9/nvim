vim.opt.compatible = false

vim.opt.showmatch = true

vim.opt.ignorecase = true

vim.opt.mouse = 'v'

vim.opt.hlsearch = true

vim.opt.incsearch = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.autoindent = true

vim.opt.number = true

vim.opt.wildmode = 'longest,list'

vim.cmd('filetype plugin indent on')

vim.cmd('syntax on')

vim.opt.clipboard = 'unnamedplus'

vim.opt.mouse = 'a'

vim.opt.ttyfast = true

vim.opt.swapfile = false

vim.g.autoformat = true

vim.o.termguicolors = true

vim.cmd([[
  call plug#begin('~/.local/share/nvim/plugged')

  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'

  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

  Plug 'folke/tokyonight.nvim'

  Plug 'stevearc/conform.nvim'

  Plug 'brenoprata10/nvim-highlight-colors'

  Plug 'samodostal/image.nvim'

  Plug 'windwp/nvim-autopairs' 

  Plug 'Exafunction/codeium.vim'

  Plug 'stevearc/oil.nvim'

  Plug 'prisma/vim-prisma'

  call plug#end()
]])

require('plugins/colorizer')
require('plugins/conform')
require('plugins/image')
require('plugins/theme')
require('plugins/telescope')
require('plugins/nvim-cmp')

-- refactor Later

require("nvim-autopairs").setup {}

require("oil").setup({
  columns = {
    "icon",
    "size",
    "mtime",
  },
  skip_confirm_for_simple_edits = true,
})

