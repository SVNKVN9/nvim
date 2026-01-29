vim.g.mapleader = " "

require('telescope').setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "dist",
      "build",
      ".git/",
      ".next",
    },
    buffer_previewer_maker = function(filepath, bufnr, opts)
      opts = opts or {}

      filepath = vim.fn.expand(filepath)
      require('telescope.previewers.utils').job_maker({ 'cat', filepath }, bufnr, opts)

      -- Use vim syntax highlighting instead of treesitter
      vim.schedule(function()
        vim.api.nvim_buf_call(bufnr, function()
          vim.cmd('filetype detect')
        end)
      end)
    end,
  }
})

vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true })
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true })
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true })
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap = true })

