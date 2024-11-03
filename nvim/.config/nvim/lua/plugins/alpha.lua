return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {}

		dashboard.section.buttons.val = {
			dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("r", "󱑆  Recently used files", ":Telescope oldfiles <CR>"),
			dashboard.button(
				"c",
				"  Configuration",
				"<cmd>lua require('telescope.builtin').find_files({ cwd = '~/.config/nvim' })<CR>"
			),
			dashboard.button("q", "󰜺  Quit Neovim", ":qa<CR>"),
		}

		dashboard.opts.layout = {
			{ type = "padding", val = math.floor(vim.o.lines * 0.33) },
			dashboard.section.header,
			{ type = "padding", val = 2 },
			dashboard.section.buttons,
		}

		alpha.setup(dashboard.config)
	end,
}
