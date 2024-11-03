vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

require("config.lazy")
require("config.keymaps")
require("config.options")
