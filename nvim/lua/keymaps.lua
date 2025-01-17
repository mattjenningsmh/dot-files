-- keymaps.lua
local map = vim.keymap.set

map("n", "<leader>e", ":20Lex<CR>", { desc = "Open file explorer" })
map("n", "<Tab>", ":tabnext<CR>", {desc = "Next tab"})
map("n", "<S-Tab>", ":tabNext<CR>", {desc = "Previous tab", noremap = true})
map('n', '<C-`>', ':bel 15split | term<CR>', { noremap = true, silent = true })
map('t', '<Esc>', '<C-\\><C-n>:q<CR>', { noremap = true })

map('i', '{', '{}<Esc>i', {noremap = true })
map('i', '}', '<Esc>la', {noremap = true})
map('i', '(', '()<Esc>i', {noremap = true})
map('i', ')', '<Esc>la', {noremap = true})

map('n', 'O', 'o<Esc>k',{noremap = true})
