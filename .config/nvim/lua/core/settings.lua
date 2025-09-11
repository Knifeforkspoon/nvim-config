-- Basic settings
vim.opt.mouse = "a"
vim.opt.compatible = false
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.ruler = true
vim.opt.hlsearch = true

-- Enable 24-bit color support for proper icon display
if vim.fn.has('termguicolors') == 1 then
  vim.opt.termguicolors = true
end

-- Font settings for Nerd Font support
vim.opt.encoding = "utf-8"
if vim.fn.has("mac") == 1 then
  vim.opt.guifont = "FiraCode Nerd Font:h12"
end

-- Disable beep and visual bell
vim.opt.visualbell = true
vim.cmd('set t_vb=')

-- Colorscheme will be set by lazy plugin config after plugins load

-- Whitespace highlighting
-- vim.api.nvim_set_hl(0, 'ExtraWhitespace', { bg = 'Magenta' })
vim.fn.matchadd('ExtraWhitespace', '\\s\\+$')
vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
  pattern = '*',
  command = 'match ExtraWhitespace /\\s\\+$/'
})
vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
  pattern = '*',
  command = 'match ExtraWhitespace /\\s\\+\\%#\\@<!$/'
})
vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
  pattern = '*',
  command = 'match ExtraWhitespace /\\s\\+$/'
})
vim.api.nvim_create_autocmd({ 'BufWinLeave' }, {
  pattern = '*',
  command = 'call clearmatches()'
})

-- Default tab settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Tags configuration
vim.opt.tags = './tags;/'

-- Enable filetype detection and plugin loading
vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')
