vim.g.mapleader = ","
vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- buffer操作
vim.keymap.set("n", "<C-p>", "<CMD>:bp<CR>")
vim.keymap.set("n", "<C-n>", "<CMD>:bn<CR>")
vim.keymap.set("n", "<C-d>", "<CMD>:bd<CR>")

-- macOS
if vim.loop.os_uname().sysname == "Darwin" then
	vim.opt.clipboard:append({ "unnamedplus" })
end

-- encoding
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = "fish"
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.inccommand = "split"
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })

vim.wo.number = true
vim.wo.signcolumn = "yes"
vim.opt.wrap = false -- No Wrap lines
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.title = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 5
-- vim.opt.background = "light"

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })
