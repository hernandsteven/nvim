local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommeded settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- highlight group for arrow
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]]) -- changing arrow color to blue

-- Protected call for icons
local ok, icons = pcall(require, "nvim-web-devicons")
if not ok then
	return
end

local gitignore = icons.get_icon(".gitignore", "", { default = true })

nvimtree.setup({
	renderer = {
		icons = {
			glyphs = {
				git = {},
				folder = {
					arrow_closed = "",
					arrow_open = "",
				},
			},
		},
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})
