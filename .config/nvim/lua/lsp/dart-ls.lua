local cmp_nvim_lsp = require('cmp_nvim_lsp')
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Flutter-specific on_attach: Only add Flutter commands if it's a Flutter project
-- Configure Dart LSP for Flutter
vim.lsp.config.dartls = {
  cmd = { 'dart', 'language-server', '--protocol=lsp' },
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    local buf_set_keymap = vim.api.nvim_buf_set_keymap
    local opts = { noremap = true, silent = true }

    -- Flutter-specific keymaps (only for Flutter projects)
    buf_set_keymap(bufnr, 'n', '<leader>r', '<cmd>FlutterRun<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<leader>d', '<cmd>FlutterDetach<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<leader>t', '<cmd>FlutterQuit<CR>', opts)
  end,
  settings = {
    dart = {
      enableSdkFormatter = true,
      analysisExcludedFolders = {
        vim.fn.expand("/Users/jhaynes/.local/share/flutter/packages"),
        vim.fn.expand("$HOME/.pub-cache"),
      },
    },
  },
  filetypes = { "dart" },
  root_markers = { "pubspec.yaml", ".git", "." }
}
