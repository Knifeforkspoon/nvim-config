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
require("core.platform")

-- Disable beep and visual bell
vim.opt.visualbell = true
vim.cmd('set t_vb=')

-- Colorscheme will be set by lazy plugin config after plugins load

-- Whitespace highlighting

-- Default tab settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Tags configuration
vim.opt.tags = './tags;/'
