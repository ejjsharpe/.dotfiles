local map = vim.keymap.set

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},

	config = function()
		map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
		map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Find word" })
		map(
			"n",
			"<leader>fa",
			"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
			{ desc = "Find all files" }
		)

		require("telescope").setup({
			defaults = {
				prompt_prefix = "   ",
				selection_caret = " ",
				entry_prefix = " ",
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = {
						prompt_position = "top",
					},
					width = 0.9,
					height = 0.8,
				},
				mappings = {
					n = { ["q"] = require("telescope.actions").close },
				},
				file_ignore_patterns = {
					"node_modules",
				},
			},
		})

		require("telescope").load_extension("fzf")
	end,
}
