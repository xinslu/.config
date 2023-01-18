require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<C-h>"] = "which_key"
            }
        },
        preview_cutoff = 1
    },
}
