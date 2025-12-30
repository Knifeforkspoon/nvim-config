vim.lsp.config('postgres_lsp', {
  cmd = { 'postgres-language-server', 'lsp-proxy' },
  filetypes = { 'sql', 'psql' },
  root_dir = vim.fs.root(0, { '.git', 'postgrs-language-server.jsonc'})
})
