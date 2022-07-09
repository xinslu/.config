local fn = vim.fn
local api = vim.api
local lsp = vim.lsp

local utils = require("utils")

-- Setup installer & lsp configs
local typescript_ok, typescript = pcall(require, 'typescript')
local lsp_installer_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')

if not lsp_installer_ok then
    return
end

lsp_installer.setup {
    -- A list of servers to automatically install if they're not already installed
    ensure_installed = { "bashls", "cssls", "graphql", "html", "jsonls", "sumneko_lua", "tailwindcss",
        "tsserver", "vetur", "vuels", "rust_analyzer", "eslint", "gopls", "dockerls" },
    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed
    automatic_installation = true,
}

local custom_attach = function(client, bufnr)
    -- Mappings.
    local opts = { silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<space>q", function() vim.diagnostic.setqflist({ open = true }) end, opts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
            local opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = 'rounded',
                source = 'always', -- show source in diagnostic popup window
                prefix = ' '
            }

            if not vim.b.diagnostics_pos then
                vim.b.diagnostics_pos = { nil, nil }
            end

            local cursor_pos = vim.api.nvim_win_get_cursor(0)
            if (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2]) and
                #vim.diagnostic.get() > 0
            then
                vim.diagnostic.open_float(nil, opts)
            end

            vim.b.diagnostics_pos = cursor_pos
        end
    })

    -- Set some key bindings conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting_sync, opts)
    end
    if client.resolved_capabilities.document_range_formatting then
        vim.keymap.set("x", "<space>f", vim.lsp.buf.range_formatting, opts)
    end

    -- The blow command will highlight the current variable and its usages in the buffer.
    if client.resolved_capabilities.document_highlight then
        vim.cmd([[
      hi! link LspReferenceRead Visual
      hi! link LspReferenceText Visual
      hi! link LspReferenceWrite Visual
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]   )
    end

    if vim.g.logging_level == 'debug' then
        local msg = string.format("Language server %s started!", client.name)
        vim.notify(msg, 'info', { title = 'Nvim-config' })
    end
end

local capabilities = lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require("lspconfig")

if utils.executable('pylsp') then
    lspconfig.pylsp.setup({
        on_attach = custom_attach,
        settings = {
            pylsp = {
                plugins = {
                    pylint = { enabled = true, executable = "pylint" },
                    pyflakes = { enabled = false },
                    pycodestyle = { enabled = false },
                    jedi_completion = { fuzzy = true },
                    pyls_isort = { enabled = true },
                    pylsp_mypy = { enabled = true },
                },
            },
        },
        flags = {
            debounce_text_changes = 200,
        },
        capabilities = capabilities,
    })
else
    vim.notify("pylsp not found!", 'warn', { title = 'Nvim-config' })
end

-- if utils.executable('pyright') then
--   lspconfig.pyright.setup{
--     on_attach = custom_attach,
--     capabilities = capabilities
--   }
-- else
--   vim.notify("pyright not found!", 'warn', {title = 'Nvim-config'})
-- end

if utils.executable('clangd') then
    lspconfig.clangd.setup({
        on_attach = custom_attach,
        capabilities = capabilities,
        filetypes = { "c", "cpp", "cc" },
        flags = {
            debounce_text_changes = 500,
        },
    })
else
    vim.notify("clangd not found!", 'warn', { title = 'Nvim-config' })
end

-- set up vim-language-server
if utils.executable('vim-language-server') then
    lspconfig.vimls.setup({
        on_attach = custom_attach,
        flags = {
            debounce_text_changes = 500,
        },
        capabilities = capabilities,
    })
else
    vim.notify("vim-language-server not found!", 'warn', { title = 'Nvim-config' })
end

-- set up bash-language-server
if utils.executable('bash-language-server') then
    lspconfig.bashls.setup({
        on_attach = custom_attach,
        capabilities = capabilities,
    })
end

lspconfig.sumneko_lua.setup({
    on_attach = custom_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = runtime_path,
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
-- local handlers = {
--     ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
--     ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
-- }

lspconfig.eslint.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
    settings = require('configs.lsp.eslint').settings,
}

lspconfig.jsonls.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
    settings = require('configs.lsp.jsonls').settings,
}

lspconfig.gopls.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
}

lspconfig.dockerls.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
}

lspconfig.rust_analyzer.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
}


lspconfig.html.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
}
-- Change diagnostic signs.
-- fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticSignError" })
-- fn.sign_define("DiagnosticSignWarn", { text = "!", texthl = "DiagnosticSignWarn" })
-- fn.sign_define("DiagnosticSignInformation", { text = "", texthl = "DiagnosticSignInfo" })
-- fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

-- global config for diagnostic
vim.diagnostic.config({
    underline = false,
    virtual_text = false,
    signs = true,
    severity_sort = true,
})

-- lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
--   underline = false,
--   virtual_text = false,
--   signs = true,
--   update_in_insert = false,
-- })
