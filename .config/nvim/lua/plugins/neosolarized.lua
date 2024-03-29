local status, n = pcall(require, "neosolarized")
if not status then
	return
end

n.setup({
	comment_italics = true,
})

-- local cb = require("colorbuddy.init")
-- local Color = cb.Color
-- local colors = cb.colors
-- local Group = cb.Group
-- local groups = cb.groups
-- local styles = cb.styles
--
-- Color.new("black", "#000000")
-- Color.new("lightpurple", "#6c71c4")
-- Color.new("lightblue", "#268bd2")
-- Group.new("CursorLine", colors.none, colors.base03, styles.NONE, colors.base1)
-- Group.new("CursorLineNr", colors.yellow, colors.black, styles.NONE, colors.base1)
-- Group.new("Visual", colors.none, colors.base03, styles.reverse)
-- -- custom
-- Group.new("Type", colors.lightpurple, colors.none, styles.NONE, colors.base1)
-- Group.new("Conditional", colors.lightpurple, colors.none, styles.NONE, colors.base1)
-- Group.new("Special", colors.yellow, colors.none, styles.NONE, colors.base1)
--
-- local cError = groups.Error.fg
-- local cInfo = groups.Information.fg
-- local cWarn = groups.Warning.fg
-- local cHint = groups.Hint.fg
--
-- Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
-- Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
-- Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
-- Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)

-- vim.opt.background = "light"

vim.cmd([[colorscheme NeoSolarized]])
