return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'svelte', 'html', 'typescript', 'javascript' },
        highlight = { enable = true },
      })
    end
  },
}
