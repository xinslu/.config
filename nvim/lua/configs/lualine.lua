require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "sonokai",
        section_separators = "",
        component_separators = "",
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = {
            "filename",
            "ime_state",
            "spell"
        },
        lualine_x = {
            "encoding",
            "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = {
            "location",
            {
                "diagnostics",
                sources = { "nvim_diagnostic" }
            },
            {
                trailing_space,
                color = "WarningMsg"
            },
            {
                mixed_indent,
                color = "WarningMsg"
            },
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = { 'quickfix', 'fugitive' },
})
