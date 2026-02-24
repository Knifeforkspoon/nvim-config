return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    commit = "dc42c209",
    config = function()
      require('nvim-treesitter').setup({
        ensure_installed = { 'svelte', 'html', 'typescript', 'javascript' },
        highlight = { enable = true },
      })
    end
  },
}
