vim.lsp.config.svelte = {
  cmd = { "npx", "svelte-language-server", "--stdio" },
  filetypes = { "svelte" },
  root_markers = { "package.json", "svelte.config.js", ".git" },
}

