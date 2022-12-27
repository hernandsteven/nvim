local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local lualine_theme = require("lualine.themes.nightfly")

lualine.setup({
	options = {
		theme = lualine_theme,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},

	extensions = { "toggleterm", "nvim-tree", "fugitive" },
})
