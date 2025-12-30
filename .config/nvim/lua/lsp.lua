require('lsp.dart-ls')
require('lsp.lua-ls')
require('lsp.python-ls')
require('lsp.typescript-ls')
require('lsp.svelte-ls')
require('lsp.yaml')
require('lsp.postgres-ls')

vim.lsp.enable(
  {
    "dart",
    "lua",
    "typescript",
    "svelte",
    "yaml",
    "postgres_lsp"
  }
)
