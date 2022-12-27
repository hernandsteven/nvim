-- Calling the colorscheme installed using packer, using a protected call
local status, colorscheme = pcall(require, "neosolarized")
if not status then
	print("Colorscheme not found!")
	return
end

--Setting up colorscheme
colorscheme.setup({
	comment_italics = true,
})

--Setting up colorbuddy
local Color, colors, Group, groups, styles = require("colorbuddy").setup()

--Highlight Group Cutomization
--Colors
Color.new("black", "#000000")
Color.new("background", "#282c34")

--Groups
--Group.new("IndentBlanklineChar", groups.Comment.fg)
Group.new("Normal", groups.Normal.fg:light())
Group.new("CursorLine", colors.none, colors.base03:dark(), styles.NONE, colors.base1)
Group.new("CursorLineNr", colors.yellow, colors.black, styles.NONE)
Group.new("ModeMsg", groups.ModeMsg.fg:light(), colors.black)
--Group.new("Visual", colors.none, colors.base03, styles.reverse)
--Group.new("Keyword", groups.ModeMsg.fg:light())
--Group.new("Function", colors.yellow)
--Group.new("Operator", groups.ModeMsg.fg:light())

--NvimTree Git highlight groups
Group.new("NvimTreeGitDeleted", colors.red, nil)
Group.new("NvimTreeGitStaged", colors.green, nil)
Group.new("NvimTreeGitDirty", colors.red, nil)

--BarBar highlight groups
Group.new("BufferTabpageFill", nil, nil)
Group.new("BufferCurrent", colors.yellow, nil)

--Copilot highlight groups
Group.new("CopilotSuggestion", colors.yellow, nil, styles.undercurl)

local cError = groups.Error.fg
local cInfo = groups.Information.fg
local cWarn = groups.Warning.fg
local cHint = groups.Hint.fg

Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)
