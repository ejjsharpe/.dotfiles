local map = vim.keymap.set

-- Easy mode switching
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<esc>")

-- Mac esc+ keymaps
map("i", "<D-BS>", "<C-o>dd", { noremap = true, silent = true })
map("i", "<A-BS>", "<C-w>", { noremap = true, silent = true })

-- Save file in all modes
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Move around in insert mode
map("i", "<C-b>", "<ESC>^i", { desc = "Move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Move end of line" })
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })

-- Window switch
map("n", "<C-h>", "<C-w>h", { desc = "Switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch window up" })

-- General
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear highlights" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "Copy whole file" })

-- Line numbers
map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "Toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "Toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- Nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file tree" })

-- Diff View
map("n", "<leader>gd", "<cmd>DiffviewToggle<CR>", { desc = "Git diff view" })

-- Barbar
map("n", "<Tab>", "<Cmd>BufferNext<CR>", { desc = "Next buffer" })
map("n", "<leader>x", "<Cmd>BufferClose<CR>", { desc = "Close buffer" })
