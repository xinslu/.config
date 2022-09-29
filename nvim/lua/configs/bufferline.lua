require("bufferline").setup {}


nvim_tree_events.on_tree_open(function()
    bufferline_state.set_offset(30, "")
end)

nvim_tree_events.on_tree_close(function()
    bufferline_state.set_offset(0)
end)
