local fn = vim.fn

-- inspect something
function inspect(item)
    vim.pretty_print(item)
end

local M = {}

function M.executable(name)
    if fn.executable(name) > 0 then
        return true
    end

    return false
end

function M.may_create_dir()
    local fpath = fn.expand('<afile>')
    local parent_dir = fn.fnamemodify(fpath, ":p:h")
    local res = fn.isdirectory(parent_dir)

    if res == 0 then
        fn.mkdir(parent_dir, 'p')
    end
end
function M.map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return M
