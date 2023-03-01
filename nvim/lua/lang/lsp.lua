local configs = require("lang.lsp_configs")

local lspconfig = require("lspconfig")

local lsps = { "pyright", "bashls", "eslint", "jdtls", "gopls", "texlab", "dockerls", "html", "hls", "tsserver" }

for _, lsp_name in ipairs(lsps) do
    lspconfig[lsp_name].setup {
        on_attach = configs.custom_attach,
        capabilities = configs.capabilities,
        single_file_support = true,
    }
end


lspconfig.lua_ls.setup({
    on_attach = configs.custom_attach,
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
    capabilities = configs.capabilities,
})

lspconfig.eslint.setup {
    on_attach = configs.custom_attach,
    capabilities = configs.capabilities,
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
    on_attach = configs.custom_attach,
    capabilities = configs.capabilities,
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
