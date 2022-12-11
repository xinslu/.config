require('telescope').setup {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key"
            }
        },
        preview_cutoff = 1
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    }
}


vim.keymap.set('n', '<C-f>',
    ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>"
    , { noremap = true, desc = "Project Wide search" })
vim.keymap.set('n', '<C-s>', ":lua require('telescope.builtin').find_files()<CR>"
    ,
    { noremap = true, desc = "Project Wide File search" })
vim.keymap.set('n', 'gr', ":lua require('telescope.builtin').lsp_references()<CR>"
    ,
    { noremap = true, desc = "Project Wide File search" })
