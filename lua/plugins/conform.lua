require("conform").setup({
    formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        solidity = { "prettier_solidity" },
        php = { "php_cs_fixer" },
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

        php_cs_fixer = {  -- <-- เพิ่ม formatter PHP
            command = "php-cs-fixer",
            args = {
                "fix",
                "--using-cache=no",
                "--quiet",
                "$FILENAME"
            },
            stdin = false,  -- php-cs-fixer อ่านไฟล์ตรง ๆ
        },
    },
})
