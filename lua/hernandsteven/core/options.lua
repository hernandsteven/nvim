local opt = vim.opt -- for conciseness
local cmd = vim.cmd
local exec = vim.api.nvim_exec -- Execute Vimscript
local g = vim.g --Global Variable

-- add padding for nvim tree and barbar

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "NvimTree" then
			require("bufferline.api").set_offset(31, "FileTree")
		end
	end,
})

vim.api.nvim_create_autocmd("BufWinLeave", {
	pattern = "*",
	callback = function()
		if vim.fn.expand("<afile>"):match("NvimTree") then
			require("bufferline.api").set_offset(0)
		end
	end,
})

opt.foldcolumn = "0"
opt.signcolumn = "yes"
opt.mouse = "a" -- Enable mouse support
opt.swapfile = false -- Don't use swapfile
opt.showmatch = true -- Highlight matching parenthesis

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indents
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true -- Autoindent new lines

--line wrapping
opt.wrap = false

--search settings
opt.ignorecase = true
opt.smartcase = true

--cursor line
opt.cursorline = true

--appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

--backspace
opt.backspace = "indent,eol,start"

--clipboard
opt.clipboard:append("unnamedplus")

--split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- Enable background buffers
opt.history = 100 -- Remember N lines in history
opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 400 -- ms to wait for trigger 'document_highlight'
-- Disable nvim intro
opt.shortmess:append("sI")

-- Disable builtins plugins
local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
}

for _, plugin in pairs(disabled_built_ins) do
	g["loaded_" .. plugin] = 1
end

-----------------------------------------------------------
-- Autocommands
-----------------------------------------------------------

-- Highlight on yank
exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=800}
  augroup end
]],
	false
)
-- Remove whitespace on save
cmd([[autocmd BufWritePre * :%s/\s\+$//e]])

-- Don't auto commenting new lines
cmd([[autocmd BufEnter * set fo-=c fo-=r fo-=o]])

-- Remove line lenght marker for selected filetypes
cmd([[
  autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0
]])

-- 2 spaces for selected filetypes
cmd([[
  autocmd FileType xml,html,xhtml,css,scss,javascript,json,lua,yaml setlocal shiftwidth=2 tabstop=2
]])
