require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "rust", "javascript", "typescript", "help" },
    sync_install = false,
    auto_install = true,
    indent = { enable = true, disable = { 'python' } },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
        },
    },
    query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = {"BufWrite", "CursorHold"},
    },
    highlight = {
        enable = true,
        disable = { 'latex' },
        additional_vim_regex_highlighting = true,
    }
}
