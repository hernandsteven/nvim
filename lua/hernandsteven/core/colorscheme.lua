-- Calling the colorscheme installed using packer, using a protected call
-- local status, colorscheme = pcall(require, "neosolarized")
-- if not status then
-- 	print("Colorscheme not found!")
-- 	return
-- end
--
-- --Setting up colorscheme
-- colorscheme.setup({
-- 	comment_italics = true,
-- })

vim.cmd([[colorscheme nightfly]])

--Setting up colorbuddy
local Color, colors, Group, groups, styles = require("colorbuddy").setup()

--Colors
Color.new("babyblue", "#3FC5FF")
Color.new("background", "#282c34")

--Highlight Group Cutomization

-- remove color from tab fill and separator
vim.cmd([[highlight BufferTabpageFill ctermbg=255 ctermfg=255 ]])
vim.cmd([[highlight NvimTreeWinSeparator ctermbg=255 ctermfg=255 ]])
--Groups

--Status Line
Group.new("StatusLine", nil, nil)
Group.new("StatusLineNC", nil, nil)
Group.new("CursorLineNr", colors.gold, nil, styles.NONE)

--BarBar highlight groups
Group.new("BufferVisible", nil, nil)
Group.new("BufferDefaultVisibleSign", nil, nil)
Group.new("BufferCurrent", nil, nil)
Group.new("BufferCurrentSign", nil, nil)
Group.new("BufferVisibleSign", nil, nil)

--NvimTree highlight groups
Group.new("NvimTreeNormal", nil, nil) -- Background color for nvim tree
Group.new("NvimTreeIndentMarker", colors.babyblue:dark():dark():dark()) -- Arrow color for folders
Group.new("NvimTreeCursorLine", colors.gray) -- cursor line color
Group.new("NvimTreeEndOfBuffer", nil, nil) -- ~ at the end of buffer

Group.new("NvimTreeGitDeleted", colors.red, nil)
Group.new("NvimTreeGitStaged", colors.green, nil)
Group.new("NvimTreeGitDirty", colors.red, nil)

--Copilot highlight groups
Group.new("CopilotSuggestion", colors.yellow, nil, styles.undercurl)

--local cError = groups.Error.fg
--local cInfo = groups.Information.fg
--local cWarn = groups.Warning.fg
--local cHint = groups.Hint.fg

--Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
--Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
--Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
--Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
--Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
--Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
--Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
--Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)
