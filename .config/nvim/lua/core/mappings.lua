-- Key mappings

-- Reload Neovim configuration
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<CR>', { desc = 'Reload Neovim config' })

-- Search for visually selected text
vim.keymap.set('v', '//', 'y/<C-R>"<CR>')


-- Better display for messages
vim.opt.cmdheight = 1
function ToggleCmdHeight()
  vim.o.cmdheight = vim.o.cmdheight == 1 and 6 or 1
end
vim.api.nvim_set_keymap('n','<leader>tc', ':lua ToggleCmdHeight()<CR>', { noremap =true })

-- FZF-Lua mappings
vim.keymap.set('n', '<leader>ff', '<cmd>lua require("fzf-lua").files()<CR>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', '<cmd>lua require("fzf-lua").live_grep()<CR>', { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', '<cmd>lua require("fzf-lua").buffers()<CR>', { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fh', '<cmd>lua require("fzf-lua").help_tags()<CR>', { desc = 'Help tags' })
vim.keymap.set('n', '<leader>fc', '<cmd>lua require("fzf-lua").commands()<CR>', { desc = 'Commands' })
vim.keymap.set('n', '<leader>fm', '<cmd>lua require("fzf-lua").marks()<CR>', { desc = 'Marks' })
vim.keymap.set('n', '<leader>fr', '<cmd>lua require("fzf-lua").oldfiles()<CR>', { desc = 'Recent files' })
vim.keymap.set('n', '<leader>gf', '<cmd>lua require("fzf-lua").git_files()<CR>', { desc = 'Git files' })
vim.keymap.set('n', '<leader>gs', '<cmd>lua require("fzf-lua").git_status()<CR>', { desc = 'Git status' })
