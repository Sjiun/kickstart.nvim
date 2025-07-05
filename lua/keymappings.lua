-- Copy/Paste to system clipboard (xclip)
-- vim.keymap.set('n', '<leader>y', '"+y', { desc = '[Y]ank to system clipboard' })
-- vim.keymap.set('v', '<leader>y', '"+y', { desc = '[Y]ank to system clipboard' })
-- vim.keymap.set('n', '<leader>p', '"+p', { desc = '[P]aste from system clipboard' })

-- Jump to previous files
vim.keymap.set('n', '<leader>b0', ':e#0<CR>', { desc = 'Open most recent [B]uffer' })
vim.keymap.set('n', '<leader>b1', ':e#1<CR>', { desc = 'Open second most recent [B]uffer' })

-- reset LSP
-- vim.keymap.set("n", "<leader>lr", ":LspRestart<CR>", { desc = "[L]SP [R]estart" })

-- show error messages
vim.keymap.set('n', '<leader>e', ':lua vim.diagnostic.open_float()<CR>', { desc = 'show [E]rror float on line' })

-- window navigation
vim.keymap.set('n', '<M-s>', '<C-w><C-v>', { desc = 'perform vertical [S]plit' })
vim.keymap.set('n', '<M-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<M-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<M-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<M-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- buffer navigation
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Go to next tab page' })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Go to previous tab page' })

-- enter new line
vim.keymap.set('n', '<CR>', '$a<CR>', { desc = 'Create new line at end of line' })

-- comfortably escape
-- vim.keymap.set({ 'n', 'v', 'i' }, '<M-e>', '<esc>')

-- shortcut terminal
vim.keymap.set('n', '<M-t>', '<C-w><C-v>:term<CR>i', { desc = 'open [T]erminal in vertical split' })
vim.keymap.set('n', '<M-T>', ':tabnew<CR>:term<CR>i', { desc = 'open [T]erminal in new tab' })

vim.keymap.set({ 'n', 'i', 'v' }, '<M-q>', ':q<CR>', { desc = '[Q]uit window' })

-- search for selected word
vim.keymap.set('v', '<M-f>', [[y/<C-r>=escape(@", '\/.*$^~[]')<CR>]], { desc = '[F]ind selection in file' })
-- vim.keymap.set('v', '<M-F>', 'y<leader>sg<C-r>"', { desc = '[F]ind selection in live grep' })
-- vim.keymap.set('v', '<M-F>', [[<leader>sg<C-r>=escape(@", '\/.*$^~[]')]], { desc = '[F]ind selection in live grep' })

-- explorer
-- vim.keymap.set('n', '<M-e>', ':E<CR>', { desc = 'open [E]xplorer' })
-- vim.keymap.set('n', '<M-E>', '<C-w><C-v>:E<CR>', { desc = 'open [E]xplorer in vertical split' })

-- move between lines
vim.api.nvim_set_option('whichwrap', 'lh')

-- nvim tree
vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>', { desc = '[T]ree [T]oggle' })
vim.keymap.set('n', '<leader>tf', ':NvimTreeFindFile<CR>', { desc = '[T]ree [F]ind file' })
vim.keymap.set('n', '<leader>tc', ':NvimTreeCollapse<CR>', { desc = '[T]ree [C]ollapse' })
vim.keymap.set('n', '<leader>te', ':NvimTreeFocus<CR>', { desc = '[T]ree Focus ([E]xplore)' })


-- console shortcuts
vim.keymap.set('n', '<leader>cl', 'iconsole.log("");<Esc>2hi', { desc = '[C]onsole [L]og' })
vim.keymap.set('n', '<leader>cw', 'iconsole.warn("");<Esc>2hi', { desc = '[C]onsole [W]arn' })
vim.keymap.set('n', '<leader>ce', 'iconsole.error("");<Esc>2hi', { desc = '[C]onsole [E]rror' })
vim.keymap.set('n', '<leader>ci', 'iconsole.info("");<Esc>2hi', { desc = '[C]onsole [I]nfo' })
