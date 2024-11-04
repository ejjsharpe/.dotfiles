return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local opts = {
		ensure_installed = {
			"bash",
			"diff",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"typescript",
			"javascript",
			"astro",
			"tsx",
		},
		highlight = { enable = true, use_language_tree = true },
		indent = { enable = true },
	}
		require("nvim-treesitter.configs").setup(opts)
	end

}
