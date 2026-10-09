-- 1. Define the highlight group
vim.api.nvim_set_hl(0, 'ExtraWhitespace', { bg = 'Magenta' })

-- 2. Define the matching logic functions
local function apply_trailing_whitespace_match()
  -- Matches trailing whitespace at the end of lines
  vim.fn.matchadd('ExtraWhitespace', '\\s\\+$')
end

local function apply_insert_mode_match()
  -- Matches trailing whitespace that is NOT followed by the cursor position
  vim.fn.matchadd('ExtraWhitespace', '\\s\\+\\%#\\@<!$')
end

-- 3. Set up the Autocommands
vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
  pattern = '*',
  callback = apply_trailing_whitespace_match
})

vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
  pattern = '*',
  callback = apply_insert_mode_match
})

vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
  pattern = '*',
  callback = apply_trailing_whitespace_match
})

vim.api.nvim_create_autocmd({ 'BufWinLeave' }, {
  pattern = '*',
  callback = function()
    vim.fn.clearmatches()
  end
})

-- 4. Keymaps related to whitespace
-- Delete trailing whitespace
vim.keymap.set('n', '<leader>dw', '<cmd>%s/\\s\\+$//ge<CR>', { silent = true, desc = "Delete trailing whitespace" })
