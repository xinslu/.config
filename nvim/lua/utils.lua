local fn = vim.fn
local buf 

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
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

function M.openTerm()
    local file = vim.fn.expand('%:p')
    local extension = vim.bo.filetype
    local cmd = "botright 7split | terminal"
    if vim.bo.filetype == 'lua' then
        cmd = cmd .. " lua " .. file
    end
    if vim.bo.filetype == 'python' then
        cmd = cmd .. " python " .. file
    end
    if vim.bo.filetype == 'rust' then
        cmd = cmd .. " rustc " .. file 
    end
    if vim.bo.filetype == 'haskell' then
        cmd = cmd .. " ghc " .. file 
    end
    vim.cmd(cmd)
end


function M.changeBuffer(code)
    local buffers = vim.api.nvim_list_bufs()
    local loaded_buffer = {}
    local count = 0
    for idx, buf in pairs(buffers) do
        if vim.api.nvim_buf_get_name(buf) ~= "" and vim.api.nvim_buf_get_name(buf) ~= "[Scratch]" and
            vim.api.nvim_buf_get_name(buf) ~= "[No Name]" and vim.api.nvim_buf_is_valid(buf) and
            vim.api.nvim_buf_is_loaded(buf) then
            loaded_buffer[count] = buf
            count = count + 1
        end
    end
    vim.cmd.buffer(loaded_buffer[code-1])
end

return M
