require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "lua", "rust" },
  auto_install = true,
  highlight = {
    enable = true,
  }
}
