local cmp_nvim_lsp = require('cmp_nvim_lsp')
local capabilities = cmp_nvim_lsp.default_capabilities()

vim.lsp.config.rust = {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = { 'Cargo.toml', '.git' },
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
        loadOutDirsFromCheck = true,
        buildScripts = { enable = true },
      },
      checkOnSave = {
        enable = true,
        command = 'clippy',
        extraArgs = { '--no-deps' },
      },
      procMacro = {
        enable = true,
      },
      inlayHints = {
        enable = true,
        bindingModeHints = false,
        chainingHints = true,
        closureReturnTypeHints = true,
        lifetimeElisionHints = { enable = 'always', useParameterNames = true },
        maxLength = 25,
        parameterHints = true,
        renderColocatedLifetimes = true,
        typeHints = true,
      },
      diagnostics = {
        enable = true,
        experimental = { enable = false },
      },
    },
  },
}
