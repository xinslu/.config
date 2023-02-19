local fn = vim.fn
local api = vim.api
local lsp = vim.lsp
local pid = vim.fn.getpid()
local cmd = vim.cmd -- execute Vim commands
local utils = require("utils")

require("mason").setup()

local custom_attach = function(client, bufnr)
    -- Mappings.
    local opts = { silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    if client.server_capabilities.signature_help then
        vim.keymap.set("n", "<C-[>", vim.lsp.buf.signature_help, opts)
        require "lsp_signature".on_attach({
            bind = true,
            handler_opts = {
                border = "rounded"
            }
        }, bufnr)
    end
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.format, opts)
    vim.keymap.set('n', '<space>fd', function() require("telescope.builtin").diagnostics({ bufnr = 0 }) end, opts)
    vim.keymap.set('n', '<space>wd', require("telescope.builtin").diagnostics, opts)

    -- Set some key bindings conditional on server capabilities
    if client.server_capabilities.document_formatting then
        vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting_sync, opts)
    end
    if client.server_capabilities.document_range_formatting then
        vim.keymap.set("x", "<space>f", vim.lsp.buf.range_formatting, opts)
    end
end

local capabilities = lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require("lspconfig")
local lsps = { "pyright", "bashls", "eslint", "jdtls", "gopls", "texlab", "dockerls", "html", "hls", "tsserver" }
for _, lsp_name in ipairs(lsps) do
    lspconfig[lsp_name].setup {
        on_attach = custom_attach,
        capabilities = capabilities,
        single_file_support = true,
    }
end

require("clangd_extensions").setup({
    server = {
        on_attach = custom_attach,
        capabilities = capabilities,
        single_file_support = true,
    }
})


require("neodev").setup({})

lspconfig.lua_ls.setup({
    on_attach = custom_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = { "?.lua", "?/init.lua", "?/?.lua" }
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
    capabilities = capabilities,
})

lspconfig.eslint.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
    settings = {
        format = true,
        onIgnoredFiles = "off",
        packageManager = "npm",
        quiet = false,
        rulesCustomizations = {},
        run = "onType",
        useESLintClass = false,
        validate = "on",
        workingDirectory = {
            mode = "location"
        }
    },
}

lspconfig.jsonls.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
    settings = { json = {
        schemas = {
            {
                fileMatch = { "package.json" },
                url = "https://json.schemastore.org/package.json"
            },
            {
                fileMatch = { "tsconfig*.json" },
                url = "https://json.schemastore.org/tsconfig.json"
            },
            {
                fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" },
                url = "https://json.schemastore.org/prettierrc.json"
            },
            {
                fileMatch = { ".eslintrc", ".eslintrc.json" },
                url = "https://json.schemastore.org/eslintrc.json"
            },
            {
                fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
                url = "https://json.schemastore.org/babelrc.json"
            },
            {
                fileMatch = { "lerna.json" },
                url = "https://json.schemastore.org/lerna.json"
            },
            {
                fileMatch = { "now.json", "vercel.json" },
                url = "https://json.schemastore.org/now.json"
            },
            {
                fileMatch = { "ecosystem.json" },
                url = "https://json.schemastore.org/pm2-ecosystem.json"
            },
        }
    } },
}


lspconfig.omnisharp.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
    cmd = { "/usr/local/bin/omnisharp-roslyn/run", "--languageserver", "--hostPID", tostring(pid) }
}

local rt = require("rust-tools")

rt.setup({
    server = {
        on_attach = function(_, bufnr)
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
})

-- Change diagnostic signs.
fn.sign_define("DiagnosticSignError", { text = "x", texthl = "DiagnosticSignError", })
fn.sign_define("DiagnosticSignWarn", { text = "!", texthl = "DiagnosticSignWarn" })
fn.sign_define("DiagnosticSignInformation", { text = "i", texthl = "DiagnosticSignInfo" })
fn.sign_define("DiagnosticSignHint", { text = "?", texthl = "DiagnosticSignHint" })

-- global config for diagnostic
vim.diagnostic.config({
    underline = false,
    signs = true,
    virtual_text = {
        prefix = '●', -- Could be '■', '▎', 'x'
        severity = { min = vim.diagnostic.severity.WARN }
    },
    severity_sort = true,
    float = {
        source = "always", -- Or "if_many"
    },
})
