local fn = vim.fn
local redirect = vim.fn.has('win32') == 1 and "nul" or "/dev/null"
local exclude_fts={'NvimTree', 'help', 'dashboard', 'lir', 'alpha', '[Scratch]', '[No Name]'}

-- inspect something
function inspect(item)
    vim.pretty_print(item)
end

local M = {}


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


function M.update_branch()
    local cmd = io.popen('git branch --show-current 2>' .. redirect)
    local branch = ''
    if cmd ~= nil then
        branch = cmd:read("*l") or cmd:read("*a")
        cmd:close()
    end

    return branch ~= "" and "" .. branch or ""
end

function M.tabline()
    local counter = 1
    local tabline = "%#Tabline#"
    for _, buf in pairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_is_loaded(buf) then

            local f_name = vim.api.nvim_buf_get_name(buf):match("^.+[\\/](.+)$") or ""

            if (vim.tbl_contains(exclude_fts, vim.bo[buf].ft) or f_name == "") then
                goto next
            else
                f_name = " ".. f_name .." " end

            tabline = tabline.. "%#Tabline"..((vim.api.nvim_get_current_buf() == buf) and "Sel" or "Inactive").."# " .. counter .. f_name
            counter = counter + 1
        end
        ::next::
    end
    return tabline.."%#Stabline#%=".. ""
end

return M
