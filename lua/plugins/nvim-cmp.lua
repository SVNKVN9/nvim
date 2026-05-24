local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping(function(fallback)
      local ok, minuet_vt = pcall(require, 'minuet.virtualtext')
      if ok and minuet_vt.action.is_visible() then
        minuet_vt.action.accept()
      elseif cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
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

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- TypeScript/JavaScript
vim.lsp.config.ts_ls = {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    root_markers = { 'package.json', 'tsconfig.json' },
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        vim.keymap.set('n', 'Gd', vim.lsp.buf.definition, { noremap = true, silent = true, buffer = bufnr })
    end,
}

-- Tailwind CSS
vim.lsp.config.tailwindcss = {
    cmd = { 'tailwindcss-language-server', '--stdio' },
    filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'php' },
    root_markers = { 'tailwind.config.js', 'tailwind.config.ts' },
    capabilities = capabilities,
}

-- Rust
vim.lsp.config.rust_analyzer = {
    cmd = { 'rustup', 'run', 'stable', 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = { 'Cargo.toml' },
    settings = {
        ['rust-analyzer'] = {
            cargo = {
                allFeatures = true,
                sysroot = '/var/lib/nix-homes/work/.rustup/toolchains/stable-x86_64-unknown-linux-gnu',
            },
            checkOnSave = true,
            check = { command = 'clippy' },
            diagnostics = { enable = true },
        }
    },
    capabilities = capabilities,
}

-- Prisma
vim.lsp.config.prismals = {
    cmd = { 'prisma-language-server', '--stdio' },
    filetypes = { 'prisma' },
    root_markers = { 'schema.prisma' },
    capabilities = capabilities,
}

-- Solidity
vim.lsp.config.solidity_ls = {
    cmd = { 'nomicfoundation-solidity-language-server', '--stdio' },
    filetypes = { 'solidity' },
    root_markers = { 'hardhat.config.js', 'foundry.toml' },
    settings = {
        solidity = {
            includePath = 'node_modules',
            remapping = {
                ['@openzeppelin/'] = 'node_modules/@openzeppelin/'
            }
        }
    },
    capabilities = capabilities,
}

-- Go
vim.lsp.config.gopls = {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod' },
    root_markers = { 'go.work', 'go.mod', '.git' },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
    capabilities = capabilities,
}

-- PHP + WordPress
vim.lsp.config.intelephense = {
    cmd = { 'intelephense', '--stdio' },
    filetypes = { 'php' },
    root_markers = { 'composer.json', 'wp-config.php', 'wp-content', '.git', 'functions.php', 'style.css' },
    settings = {
        intelephense = {
            stubs = {
                "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core",
                "curl", "date", "dba", "dom", "enchant", "exif", "fileinfo",
                "filter", "fpm", "ftp", "gd", "gettext", "gmp", "hash", "iconv",
                "imap", "intl", "json", "ldap", "libxml", "mbstring", "meta",
                "mysqli", "oci8", "odbc", "openssl", "pcntl", "pcre", "PDO",
                "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql", "Phar", "posix",
                "readline", "Reflection", "regex", "session", "shmop", "SimpleXML",
                "snmp", "soap", "sockets", "sodium", "SPL", "sqlite3", "standard",
                "superglobals", "sysvmsg", "sysvsem", "sysvshm", "tidy", "tokenizer",
                "xml", "xmlreader", "xmlrpc", "xmlwriter", "xsl", "Zend OPcache",
                "zip", "zlib",
                -- WordPress stubs
                "wordpress", "wordpress-globals", "wp-cli", "woocommerce"
            },
            files = {
                maxSize = 5000000,
            },
            environment = {
                includePaths = {
                    vim.fn.expand("~/.config/composer/vendor/php-stubs/wordpress-stubs"),
                    vim.fn.expand("~/.config/composer/vendor/php-stubs/woocommerce-stubs"),
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
    capabilities = capabilities,
}

-- Python
vim.lsp.config.pyright = {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git' },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'workspace',
            },
        },
    },
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        local root = client.config.root_dir or vim.fn.getcwd()
        -- หา venv ใน project root
        for _, venv_name in ipairs({ 'venv', '.venv', 'env', '.env' }) do
            local python = root .. '/' .. venv_name .. '/bin/python'
            if vim.fn.filereadable(python) == 1 then
                client.config.settings.python.pythonPath = python
                client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
                break
            end
        end
    end,
}

-- Kotlin
vim.lsp.config.kotlin_language_server = {
    cmd = { 'kotlin-language-server' },
    filetypes = { 'kotlin' },
    root_markers = { 'settings.gradle', 'settings.gradle.kts', 'build.gradle', 'build.gradle.kts', 'pom.xml', '.git' },
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        vim.keymap.set('n', 'Gd', vim.lsp.buf.definition, { noremap = true, silent = true, buffer = bufnr })
    end,
}

-- เปิดใช้งาน LSP ทั้งหมด
vim.lsp.enable({
    'ts_ls',
    'tailwindcss',
    'rust_analyzer',
    'prismals',
    'solidity_ls',
    'gopls',
    'intelephense',
    'pyright',
    'kotlin_language_server',
})
