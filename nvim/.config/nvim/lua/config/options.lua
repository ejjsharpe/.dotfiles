local opt = vim.opt

-- theme
vim.g.tundra_biome = "arctic"
opt.background = "dark"
vim.cmd("colorscheme tundra")

-- Line numbers
opt.number = true
opt.numberwidth = 2

-- Enable mouse mode
opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
opt.showmode = false

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = "yes"

-- Decrease update time
opt.updatetime = 250

-- Decrease mapped sequence wait time
opt.timeoutlen = 300

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Preview substitutions live
opt.inccommand = "split"

-- Show which line your cursor is on
opt.cursorline = true

-- Dont let more than 10 lines go off unless its the end of the pages
opt.scrolloff = 10

opt.laststatus = 3
