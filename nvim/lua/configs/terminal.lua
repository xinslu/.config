terminal = require('nvim-terminal').DefaultTerminal;

local silent = { silent = true }

vim.api.nvim_set_keymap('n', '<leader>t', ':lua terminal:toggle()<cr>', silent)
vim.api.nvim_set_keymap('n', '<leader>1', ':lua terminal:open(1)<cr>', silent)
vim.api.nvim_set_keymap('n', '<leader>2', ':lua terminal:open(2)<cr>', silent)
vim.api.nvim_set_keymap('n', '<leader>3', ':lua terminal:open(3)<cr>', silent)
vim.api.nvim_set_keymap('n', '<leader>4', ':lua terminal:open(4)<cr>', silent)
vim.api.nvim_set_keymap('n', '<leader>5', ':lua terminal:open(5)<cr>', silent)
vim.api.nvim_set_keymap('n', '<leader>=', ':lua NTGlobal["window"]:change_height(2)<cr>', silent)
