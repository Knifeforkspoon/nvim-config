return {
  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    config = function()
      -- Set markdown preview options
      vim.g.mkdp_auto_start = 0  -- Don't open preview automatically
      vim.g.mkdp_auto_close = 1  -- Close preview when leaving buffer
      vim.g.mkdp_refresh_slow = 0  -- Refresh on save and leaving insert mode
      vim.g.mkdp_browser = ""  -- Use default browser
      vim.g.mkdp_echo_preview_url = 1  -- Echo preview URL when opened
      -- MermaidJS and other diagram support is enabled by default
      -- Custom CSS for diagrams
      vim.g.mkdp_markdown_css = ""
      vim.g.mkdp_highlight_css = ""
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = {},
        maid = {},
        disable_sync_scroll = 0,
        sync_scroll_type = "middle",
        hide_yaml_meta = 1,
        sequence_diagrams = {},
        flowchart_diagrams = {},
        content_editable = false,
        disable_filename = 0,
        toc = {},
        custom_css = ".markdown-body pre.mermaid { zoom: 1.5; } /* Make diagrams 50% larger */",
        custom_js = "document.addEventListener('wheel', function(e) { if (e.ctrlKey) { e.preventDefault(); var mermaidDiagrams = document.querySelectorAll('.mermaid'); mermaidDiagrams.forEach(function(diagram) { var currentZoom = parseFloat(diagram.style.zoom || 1); if (e.deltaY < 0) { diagram.style.zoom = (currentZoom * 1.1); } else { diagram.style.zoom = (currentZoom * 0.9); } }); } }, { passive: false });"
      }
      -- Custom mappings for markdown preview
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          vim.keymap.set("n", "<leader>mp", "<Plug>MarkdownPreviewToggle", 
                        { noremap = false, silent = true, buffer = true, desc = "Toggle markdown preview" })
        end
      })
    end,
  },
}
