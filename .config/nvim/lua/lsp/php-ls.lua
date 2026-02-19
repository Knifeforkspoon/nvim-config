vim.lsp.config.phpactor = {
  cmd = { "php", "-d", "error_reporting=E_ALL & ~E_DEPRECATED", "phpactor", "language-server" },
  filetypes = { "php" },
  root_markers = { "composer.json", ".git", ".phpactor.json", ".phpactor.yml" },
  settings = {
    phpactor = {
      completion = {
        enabled = true,
      },
    },
  },
}
