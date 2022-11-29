local capas = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capas.offsetEncoding = { "utf-16" }

local lspconfig = require("lspconfig")
require("mason").setup()
require("mason-lspconfig").setup_handlers({
	function(server)
		local navic = require("nvim-navic")
		local opt = {
			-- -- Function executed when the LSP server startup
			on_attach = function(client, bufnr)
				local opts = { noremap = true, silent = true }
				vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
				-- navic
				navic.attach(client, bufnr)
				-- client.resolved_capabilities.document_formatting = true
				-- vim.cmd 'autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)'
				-- vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]])
			end,
			capabilities = capas,
		}
		lspconfig[server].setup(opt)
	end,
})

-- language specific settings
-- suppress "undefined global `vim`"
lspconfig.sumneko_lua.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
