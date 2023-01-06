local cmd = vim.cmd -- execute Vim commands
vim.g.sonokai_diagnostic_virtual_text  = 'colored'
vim.g.sonokai_disable_terminal_colors = 1
cmd("set termguicolors")
cmd('colorscheme sonokai')
cmd("highlight Normal guibg=#0f0f0f")
cmd('highlight EndOfBuffer ctermfg=241 guifg=#0f0f0f')
-- cmd('highlight BufferCurrent guibg=#0f0f0f')
-- cmd('highlight BufferCurrentIndex guibg=#0f0f0f')
-- cmd('highlight BufferCurrentMod guibg=#0f0f0f')
-- cmd('highlight BufferCurrentSign guibg=#0f0f0f')
-- cmd('highlight BufferCurrentIcon guibg=#0f0f0f')
-- cmd('highlight BufferCurrentMod guibg=#0f0f0f')
-- cmd('highlight BufferOffset guibg=#0f0f0f')
-- cmd('highlight StatusLine guifg=#0f0f0f guibg=#0f0f0f')
-- cmd('highlight StatusLineNC guibg=#0f0f0f')
-- cmd('highlight TabLineFill guibg=#0f0f0f')
-- cmd('highlight TabLineSel guibg=#0f0f0f')
cmd('highlight Comment gui=italic')
