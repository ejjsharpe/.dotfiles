return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
	},

	config = function()
		-- Set up LSP key mappings on LspAttach
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
				end

				map("gd", require("telescope.builtin").lsp_definitions, "Go to definition")
				map("gr", require("telescope.builtin").lsp_references, "Go to references")
				map("gI", require("telescope.builtin").lsp_implementations, "Go to implementation")
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Go to type definition")
				map("<leader>rn", vim.lsp.buf.rename, "Rename")
				map("<leader>ca", vim.lsp.buf.code_action, "Code action", { "n", "x" })
			end,
		})

		-- Add cmp_nvim_lsp capabilities
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			},
			html = {},
			cssls = {},
			ts_ls = {},
			astro = {},
		}

		require("mason").setup()

		local ensure_installed = vim.tbl_keys(servers or {})

		vim.list_extend(ensure_installed, {
			"stylua",
			"prettier",
			"prettierd",
			"eslint_d",
		})

		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server_opts = vim.tbl_deep_extend("force", {
						capabilities = capabilities,
					}, servers[server_name] or {})

					require("lspconfig")[server_name].setup(server_opts)
				end,
			},
		})
	end,
}
