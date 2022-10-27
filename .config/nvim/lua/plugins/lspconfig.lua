-- suppress "undefined global `vim`"
require("lspconfig").sumneko_lua.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
