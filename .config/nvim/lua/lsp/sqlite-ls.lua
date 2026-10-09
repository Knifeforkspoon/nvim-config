vim.lsp.sqlite_lsp = {
  cmd = { 'syntaqlite', 'lsp' },
  filetypes = { 'sql' },
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, { '.git' })
    if root and vim.fn.filereadable(vim.fs.joinpath(root, 'syntaqlite.toml')) == 1 then
      on_dir(root)
    end
  end,
}
