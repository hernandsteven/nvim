local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local lualine_theme = require("lualine.themes.nightfly")

lualine.setup({
	options = {
		theme = lualine_theme,
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
	},

	sections = {
		lualine_a = { "mode", "branch" },
		lualine_b = { "" },
		lualine_c = { "filename" },
		lualine_d = { "filename" },
		lualine_x = {
			function()
				return os.date("%I:%M %p")
			end,
		},
		lualine_y = { "filetype" },
		lualine_z = { "progress", "location" },
	},

	extensions = { "toggleterm", "nvim-tree", "fugitive" },
})
