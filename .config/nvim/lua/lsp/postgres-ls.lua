vim.lsp.config('postgres_lsp', {
  cmd = { 'postgres-language-server', 'lsp-proxy' },
  filetypes = { 'sql', 'psql' },
  root_markers = { 'postgres-language-server.jsonc' },
  workspace_required = true,
})
