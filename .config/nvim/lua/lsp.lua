require('lsp.dart-ls')
require('lsp.lua-ls')
require('lsp.python-ls')
require('lsp.typescript-ls')
require('lsp.svelte-ls')
require('lsp.yaml')

vim.lsp.enable(
  {
    "dart",
    "lua",
    "typescript",
    "svelte",
    "yaml"
  }
)
