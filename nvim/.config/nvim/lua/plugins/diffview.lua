return {
	"sindrets/diffview.nvim",
	config = function()
		local function toggle_diffview()
			local view = require("diffview.lib").get_current_view()
			if view then
				vim.cmd("DiffviewClose")
			else
				vim.cmd("DiffviewOpen")
			end
		end

		vim.api.nvim_create_user_command("DiffviewToggle", toggle_diffview, {})
	end,
}
