-- Copy/Paste to system clipboard (xclip)
-- vim.keymap.set('n', '<leader>y', '"+y', { desc = '[Y]ank to system clipboard' })
-- vim.keymap.set('v', '<leader>y', '"+y', { desc = '[Y]ank to system clipboard' })
-- vim.keymap.set('n', '<leader>p', '"+p', { desc = '[P]aste from system clipboard' })

-- Jump to previous files
-- vim.keymap.set("n", "<leader>f0", ":e#0<CR>", { desc = "[F]ile open most recent" })
-- vim.keymap.set("n", "<leader>f1", ":e#1<CR>", { desc = "[F]ile open 2nd most recent" })

-- reset LSP
-- vim.keymap.set("n", "<leader>lr", ":LspRestart<CR>", { desc = "[L]SP [R]estart" })

-- show error messages
vim.keymap.set('n', '<leader>e', ':lua vim.diagnostic.open_float()<CR>', { desc = 'show [E]rror float on line' })

-- find files
-- local builtin = require("telescope.builtin")
-- vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind [G]rep" })
-- vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp Tags" })

-- window/tab navigation
vim.keymap.set({ 'n', 'i', 'v' }, '<M-s>', '<C-w><C-v>', { desc = 'perform vertical [S]plit' })

vim.keymap.set({ 'n', 'i', 'v' }, '<M-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set({ 'n', 'i', 'v' }, '<M-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set({ 'n', 'i', 'v' }, '<M-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set({ 'n', 'i', 'v' }, '<M-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- comfortably escape
vim.keymap.set({ 'n', 'v', 'i' }, '<M-e>', '<esc>')

-- shortcut terminal
vim.keymap.set('n', '<M-t>', '<C-w><C-v>:term<CR>i', { desc = 'open [T]erminal in vertical split' })
vim.keymap.set('n', '<M-T>', ':tabnew<CR>:term<CR>i', { desc = 'open [T]erminal in new tab' })

vim.keymap.set({ 'n', 'i', 'v' }, '<M-q>', ':q<CR>', { desc = '[Q]uit window' })

-- search for selected word
vim.keymap.set('v', '<M-f>', [[y/<C-r>=escape(@", '\/.*$^~[]')<CR>]], { desc = '[F]ind selection in file' })
-- vim.keymap.set('v', '<M-F>', 'y<leader>sg<C-r>"', { desc = '[F]ind selection in live grep' })
-- vim.keymap.set('v', '<M-F>', [[<leader>sg<C-r>=escape(@", '\/.*$^~[]')]], { desc = '[F]ind selection in live grep' })
