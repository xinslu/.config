local map = require("utils").map

map('n', '<CR>', ':noh<CR><CR>')
map('n', '<C-j>', '<C-W>j')
map('n', '<C-k>', '<C-W>k')
map('n', '<C-l>', '<C-W>l')
map('n', '<C-h>', '<C-W>h')
map('t', '<Esc>', '<C-\\><C-n>')
map("n", "<space>fe", ":Explore\n")
map("n", "<A-s>", ":w<CR>")
map("n", "E", "ea")
map("n", "<A-q>", ":quitall<CR>")
map('n', '<A-,>', ':BufferPrevious<CR>')
map('n', '<A-.>', ':BufferNext<CR>')
map('n', '<A-<>', ':BufferMovePrevious<CR>')
map('n', '<A->>', ' :BufferMoveNext<CR>')
map("n", "<A-1>", ":BufferGoto 1<CR>")
map("n", "<A-2>", ":BufferGoto 2<CR>")
map("n", "<A-3>", ":BufferGoto 3<CR>")
map("n", "<A-4>", ":BufferGoto 4<CR>")
map("n", "<A-5>", ":BufferGoto 5<CR>")
map("n", "<A-6>", ":BufferGoto 6<CR>")
map("n", "<A-7>", ":BufferGoto 7<CR>")
map("n", "<A-8>", ":BufferGoto 8<CR>")
map("n", "<A-9>", ":BufferGoto 9<CR>")
map('n', '<A-0>', ':BufferLast<CR>')
map('n', '<A-p>', ':BufferPin<CR>')
map("n", "<A-w>", ":BufferClose<CR>")
map('n', '<C-p>', ':BufferPick<CR>')
map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>')
map('n', '<Space>bd', ':BufferOrderByDirectory<CR>')
map('n', '<Space>bl', ':BufferOrderByLanguage<CR>')
map('n', '<Space>bw', ':BufferOrderByWindowNumber<CR>')
map("n", " xx", "<cmd>Trouble<cr>")
map("n", " xw", "<cmd>Trouble workspace_diagnostics<cr>")
map("n", " xd", "<cmd>Trouble document_diagnostics<cr>")
map("n", " xl", "<cmd>Trouble loclist<cr>")
map("n", " xq", "<cmd>Trouble quickfix<cr>")
map("n", "gR", "<cmd>Trouble lsp_references<cr>")

vim.keymap.set('n', '<C-f>',
    function()
        require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})
    end, 
    { noremap = true, desc = "Project Wide search" })
vim.keymap.set('n', '<C-s>', 
    function()
        require('telescope.builtin').find_files()
    end,
    { noremap = true, desc = "Project Wide File search" })
vim.keymap.set('n', 'gr', 
    function()
        require('telescope.builtin').lsp_references()
    end,
    { noremap = true, desc = "Project Wide File search" })

vim.keymap.set('n', '<C-b>', 
    function()
        require("utils").openTerm()
    end,
    { noremap = true, desc = "Build System" })
