require('lsp.dart-ls')
require('lsp.lua-ls')
require('lsp.python-ls')
require('lsp.flutter-ls')

vim.lsp.enable(
  {
    "dart_ls",
    "lua_ls",
  }
)
