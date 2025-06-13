require("conform").setup({
    format_on_save = {
        timeout_ms = 3000,
        lsp_fallback = true,
    },

    formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        solidity = { "prettier_solidity" },
    },

    formatters = {
        prettier = {
            command = "prettier",
            args = {
                "--config", vim.fn.expand("$HOME/.config/prettier/.prettierrc"),
                "--stdin-filepath", "$FILENAME",
            },
        },
        
        prettier_solidity = {
            command = "prettier",
            args = {
                "--config", vim.fn.expand("$HOME/.config/prettier/.prettierrc"),
                "--plugin", "prettier-plugin-solidity",
                "--stdin-filepath", "$FILENAME"
            },
            stdin = true,
            timeout = 3000,
        },
    },

  
})
