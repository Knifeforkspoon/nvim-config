-- Smaller updatetime for CursorHold (default is 4000ms)
vim.opt.updatetime = 300

-- Don't pass messages to |ins-completion-menu|
vim.opt.shortmess:append('c')

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved
if vim.fn.has('patch-8.1.1564') == 1 then
  -- Recently vim can merge signcolumn and number column into one
  vim.opt.signcolumn = 'number'
else
  vim.opt.signcolumn = 'yes'
end

-- Use system clipboard by default
vim.opt.clipboard:append('unnamedplus')

-- Better terminal integration
if vim.fn.has('nvim') == 1 then
  -- Use terminal keycodes in the terminal
  vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

  -- Escape terminal insert mode with jk
  vim.keymap.set('t', 'jk', '<C-\\><C-n>')

  -- Open terminal in insert mode
  vim.api.nvim_create_autocmd('TermOpen', {
    pattern = '*',
    command = 'startinsert'
  })

  -- Terminal window navigation
  vim.keymap.set('t', '<A-h>', '<C-\\><C-n><C-w>h')
  vim.keymap.set('t', '<A-j>', '<C-\\><C-n><C-w>j')
  vim.keymap.set('t', '<A-k>', '<C-\\><C-n><C-w>k')
  vim.keymap.set('t', '<A-l>', '<C-\\><C-n><C-w>l')

  -- Terminal mode mappings
  vim.keymap.set('t', '<C-w>', '<C-\\><C-n><C-w>')

  -- Better terminal colors
  vim.g.terminal_color_0  = '#2e3436'
  vim.g.terminal_color_1  = '#cc0000'
  vim.g.terminal_color_2  = '#4e9a06'
  vim.g.terminal_color_3  = '#c4a000'
  vim.g.terminal_color_4  = '#3465a4'
  vim.g.terminal_color_5  = '#75507b'
  vim.g.terminal_color_6  = '#0b939b'
  vim.g.terminal_color_7  = '#d3d7cf'
  vim.g.terminal_color_8  = '#555753'
  vim.g.terminal_color_9  = '#ef2929'
  vim.g.terminal_color_10 = '#8ae234'
  vim.g.terminal_color_11 = '#fce94f'
  vim.g.terminal_color_12 = '#729fcf'
  vim.g.terminal_color_13 = '#ad7fa8'
  vim.g.terminal_color_14 = '#00f5e9'
  vim.g.terminal_color_15 = '#eeeeec'
end

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Better buffer navigation
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { silent = true })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { silent = true })

-- Highlight lines with only spaces
local function highlight_whitespace_lines()
  vim.cmd('match ErrorMsg /\\s\\+$/')
end

vim.keymap.set('n', '<leader>hs', highlight_whitespace_lines, { silent = true })

vim.api.nvim_create_autocmd({'WinEnter', 'BufEnter', 'InsertLeave'}, {
  pattern = '*',
  callback = highlight_whitespace_lines
})

vim.api.nvim_create_autocmd({'WinLeave', 'BufLeave', 'InsertEnter'}, {
  pattern = '*',
  callback = function()
    vim.cmd('match none')
  end
})

vim.keymap.set('n', '<leader>ds', '<cmd>%s/\\s\\+$//ge<CR>', { silent = true })

-- Better split management
vim.opt.splitright = true
vim.opt.splitbelow = true
