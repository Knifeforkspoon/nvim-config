return {
  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      local cmp_nvim_lsp = require('cmp_nvim_lsp')
      local capabilities = cmp_nvim_lsp.default_capabilities()

      local on_attach = function(client, bufnr)
        local buf_set_keymap = vim.api.nvim_buf_set_keymap
        local opts = { noremap=true, silent=true }
        buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)
        -- Optional flutter-tools keybindings
        buf_set_keymap(bufnr, 'n', '<leader>r', '<cmd>FlutterRun<CR>', opts)
        buf_set_keymap(bufnr, 'n', '<leader>d', '<cmd>FlutterDetach<CR>', opts)
        buf_set_keymap(bufnr, 'n', '<leader>t', '<cmd>FlutterQuit<CR>', opts)
      end

      -- Dart LSP setup
      lspconfig.dartls.setup({
        cmd = { "dart", "language-server", "--protocol=lsp" },
        on_attach = on_attach,
        capabilities = capabilities,
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
        root_dir = lspconfig.util.root_pattern("pubspec.yaml", ".git", "."),
      })
    end,
  },

  -- Flutter tools
  {
    "akinsho/flutter-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-flutter/flutter-tools.nvim",
    config = function()
      local flutter_tools = require('flutter-tools')
      flutter_tools.setup({
        LSP = {
          on_attach = function(client, bufnr)
            local buf_set_keymap = vim.api.nvim_buf_set_keymap
            local opts = { noremap=true, silent=true }
            buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
            buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
            buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
            buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
            buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
            buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
            buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
            buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)
            buf_set_keymap(bufnr, 'n', '<leader>r', '<cmd>FlutterRun<CR>', opts)
            buf_set_keymap(bufnr, 'n', '<leader>d', '<cmd>FlutterDetach<CR>', opts)
            buf_set_keymap(bufnr, 'n', '<leader>t', '<cmd>FlutterQuit<CR>', opts)
          end,
          capabilities = require('cmp_nvim_lsp').default_capabilities(),
        },
        flutter_path = "/Users/jhaynes/.local/share/flutter",
      })
    end,
  },

  -- Language syntax plugins
  "dart-lang/dart-vim-plugin",
  "elixir-editors/vim-elixir",
}