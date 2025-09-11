return {
  {
    "nvim-mini/mini.files",
    version = "v0.16.0",
    config = function()
      local MiniFiles = require("mini.files")
      MiniFiles.setup({})
      local show_dotfiles = true

      local filter_show = function(fs_entry) return true end

      local filter_hide = function(fs_entry)
          return not vim.startswith(fs_entry.name, '.')
      end

      local toggle_dotfiles = function()
          show_dotfiles = not show_dotfiles
          local new_filter = show_dotfiles and filter_show or filter_hide
          MiniFiles.refresh({ content = { filter = new_filter } })
      end

      -- Helper function to create split mappings
      local map_split = function(buf_id, lhs, direction)
        local rhs = function()
          -- Make new window and set it as target
          local cur_target = MiniFiles.get_explorer_state().target_window
          local new_target = vim.api.nvim_win_call(cur_target, function()
            vim.cmd(direction .. ' split')
            return vim.api.nvim_get_current_win()
          end)

          MiniFiles.set_target_window(new_target)

          -- Open file immediately if cursor is on a file
          local entry = MiniFiles.get_fs_entry()
          if entry and entry.fs_type ~= 'directory' then
            MiniFiles.go_in()
          end
        end

        -- Adding `desc` will result into `show_help` entries
        local desc = 'Split ' .. direction
        vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
      end

      vim.api.nvim_create_autocmd('User', {
          pattern = 'MiniFilesBufferCreate',
          callback = function(args)
              local buf_id = args.data.buf_id
              -- Tweak left-hand side of mapping to your liking
              vim.keymap.set('n', 'g.', toggle_dotfiles, { buffer = buf_id, desc = 'Toggle dotfiles' })

              -- Add split mappings
              map_split(buf_id, 'gs', 'belowright horizontal')
              map_split(buf_id, 'gv', 'belowright vertical')
              map_split(buf_id, 'gt', 'tab')
          end,
      })
    end,
  },
}
