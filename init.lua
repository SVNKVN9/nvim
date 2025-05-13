vim.opt.compatible = false

-- Show matching parentheses/brackets
vim.opt.showmatch = true

-- Case insensitive search
vim.opt.ignorecase = true

-- Enable mouse
vim.opt.mouse = 'v'

-- Highlight search matches
vim.opt.hlsearch = true

-- Incremental search
vim.opt.incsearch = true

-- Set tab width and spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.autoindent = true

-- Show line numbers
vim.opt.number = true

-- Wildmode (bash-like tab completion)
vim.opt.wildmode = 'longest,list'

-- Filetype plugin indent (for auto-indenting depending on filetype)
vim.cmd('filetype plugin indent on')

-- Enable syntax highlighting
vim.cmd('syntax on')

-- Enable system clipboard
vim.opt.clipboard = 'unnamedplus'

-- Enable mouse support in all modes
vim.opt.mouse = 'a'

-- Speed up scrolling in Vim
vim.opt.ttyfast = true

-- Disable swap files and set backup directory
vim.opt.swapfile = false

vim.g.autoformat = true

vim.o.termguicolors = true

-- Color highlighting for specific elements (optional)
-- You can uncomment and modify these if needed
-- vim.cmd('hi NonText ctermbg=none guibg=NONE')
-- vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
-- vim.cmd('hi NormalNC guibg=NONE ctermbg=NONE')
-- vim.cmd('hi SignColumn ctermbg=NONE ctermfg=NONE guibg=NONE')
-- vim.cmd('hi Pmenu ctermbg=NONE ctermfg=NONE guibg=NONE')
-- vim.cmd('hi FloatBorder ctermbg=NONE ctermfg=NONE guibg=NONE')
-- vim.cmd('hi NormalFloat ctermbg=NONE ctermfg=NONE guibg=NONE')
-- vim.cmd('hi TabLine ctermbg=None ctermfg=None guibg=None')

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
