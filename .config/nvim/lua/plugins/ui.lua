return {
  -- Colorscheme

  {
    "ellisonleao/gruvbox.nvim",
     config = function()
       require("gruvbox").setup({
         contrast = "",
       })
       vim.cmd('colorscheme gruvbox')
     end,
  },

  -- Fuzzy finder
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- Configure nvim-web-devicons
      require('nvim-web-devicons').setup({
        default = true,
        color_icons = true,
      })

      require('fzf-lua').setup({
        -- Default options
        defaults = {
          formatter = "path.filename_first",
          file_icons = true,
        },

        -- File picker
        files = {
          previewer = "builtin",
          find_opts = [[-type f -not -path '*/\.git/*' -not -path '*/node_modules/*']],
          rg_opts = "--color=never --files --hidden --follow -g '!.git' -g '!node_modules'",
          fd_opts = "--color=never --type f --hidden --follow --exclude .git --exclude node_modules",
        },
        -- Grep
        grep = {
          previewer = "builtin",
          rg_opts = "--column --line-number --no-heading --color=always --smart-case --hidden --follow --glob '!.git' --glob '!node_modules'",
        },
        -- LSP
        lsp = {
          code_actions = {
            previewer = false,
          },
        },
        -- Commands specific configuration
        commands = {
          sort_lastused = true,
          no_header = false,
          no_header_i = false,
        },
        -- UI
        winopts = {
          height = 0.85,
          width = 0.80,
          row = 0.35,
          col = 0.50,
          border = "rounded",
          preview = {
            border = "border",
            wrap = "nowrap",
            hidden = "nohidden",
            vertical = "down:45%",
            horizontal = "right:60%",
            layout = "flex",
            flip_columns = 120,
            title = true,
            title_pos = "center",
            scrollbar = "float",
            scrolloff = "-2",
            scrollchars = { "█", "" },
          },
        },
        -- Preview colors
        previewers = {
          builtin = {
            syntax = true,
            syntax_limit_l = 0,
            syntax_limit_b = 1024 * 1024, -- 1MB
            extensions = {
              ["lua"] = "lua",
              ["py"] = "python",
              ["js"] = "javascript",
              ["ts"] = "typescript",
              ["rs"] = "rust",
              ["go"] = "go",
            },
          },
        },
        -- Keymaps
        keymap = {
          builtin = {
            ["<C-d>"] = "preview-page-down",
            ["<C-u>"] = "preview-page-up",
          },
          fzf = {
            ["ctrl-q"] = "select-all+accept",
          },
        },
      })
    end,
  },
}
